import 'package:Filmes/src/ui/movie_details_g.dart';
import 'package:Filmes/src/ui/movie_list_g.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'models/item_model.dart';
import 'blocs/movies_bloc.dart';
import 'blocs/movie_detail_bloc.dart';

class App extends StatelessWidget {
  final MoviesBloc moviesBloc;
  final MovieDetailBloc movieDetailBloc;

  @provide
  App(this.moviesBloc, this.movieDetailBloc): super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: (settings){

        if(settings.name == 'movieDetail'){
          final Result result = settings.arguments;
          return MaterialPageRoute(
              builder: (context){
                return MovieDetail(
                  movieDetailBloc,
                  result.title,
                  result.backdrop_path,
                  result.overview,
                  result.release_date,
                  result.vote_average.toString(),
                  result.id,
                );
              }
          );
        }
      },
      routes: {
        '/': (context) => MovieList(moviesBloc),
      },
    );
  }
}