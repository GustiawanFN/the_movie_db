import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/rating_category.dart';
import '../cubit/movies_cubit.dart';
import '../cubit/movies_state.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filter by Rating', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Totals = ${state.filtered.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 52,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: ratings.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final r = ratings[i];
                  return Center(
                    child: ChoiceChip(
                      label: Text(r.name),
                      selected: r.name == state.rating.name,
                      onSelected: (_) => context.read<MoviesCubit>().selectRating(r),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
