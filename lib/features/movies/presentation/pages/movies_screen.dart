import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/features/movies/presentation/widgets/keyboard_tap_dismisser.dart';
import 'package:the_movie_db/features/movies/presentation/widgets/state_widgets.dart';

import '../cubit/movies_cubit.dart';
import '../cubit/movies_state.dart';
import '../widgets/filter_widget.dart';
import '../widgets/item_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearch(String value) {
    context.read<MoviesCubit>().search(value);
    setState(() {});
  }

  void _clear() {
    _controller.clear();
    _onSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardTapDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wiki Movies'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          scrolledUnderElevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                onChanged: _onSearch,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search movie title',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _controller.text.isEmpty ? null : IconButton(icon: const Icon(Icons.close), onPressed: _clear),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const FilterWidget(),
            Expanded(
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  switch (state.status) {
                    case MoviesStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case MoviesStatus.failure:
                      return ErrorStateWidget(message: state.error, onRetry: () => context.read<MoviesCubit>().load());
                    case MoviesStatus.success:
                      final list = state.filtered;
                      if (list.isEmpty) {
                        return const EmptyStateWidget();
                      }
                      return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (_, i) => ItemCard(movie: list[i]),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
