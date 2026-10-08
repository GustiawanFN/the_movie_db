import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/movies/data/datasources/api_movies.dart';
import 'features/movies/data/repositories/movies_repository_impl.dart';
import 'features/movies/domain/usecases/get_movies.dart';
import 'features/movies/presentation/cubit/movies_cubit.dart';
import 'features/movies/presentation/pages/movies_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: BlocProvider(create: (_) => MoviesCubit(GetMovies(MoviesRepositoryImpl(ApiMovies(http.Client()))))..load(), child: const MoviesScreen()),
    );
  }
}
