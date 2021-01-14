// import 'package:flutter/material.dart';
// import '../models/item_model.dart';
// import '../blocs/movies_bloc.dart';
// import 'star_rating.dart';
// import 'movie_detail.dart';
// import 'movie_details.dart';
//
// class MovieListOld extends StatefulWidget {
//   final MoviesBloc _bloc;
//
//   MovieList(this._bloc);
//
//   @override
//   State<StatefulWidget> createState() {
//     return MovieListState();
//   }
// }
//
// class MovieListState extends State<MovieList> {
//   @override
//   void initState() {
//     super.initState();
//     widget._bloc.init();
//     widget._bloc.fetchAllMovies();
//   }
//
//   @override
//   void dispose() {
//     widget._bloc.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Popular Movies'),
//       ),
//       body: StreamBuilder(
//         stream: widget._bloc.allMovies,
//         builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//           if (snapshot.hasData) {
//             return buildList(snapshot);
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
//
//   Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
//     return GridView.builder(
//         itemCount: snapshot.data.results.length,
//         gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, crossAxisSpacing: 0, childAspectRatio: 0.7),
//         itemBuilder: (BuildContext context, int index) {
//
//           return GridTile(
//               child: InkResponse(
//                 enableFeedback: true,
//                 child: _construirCard(snapshot.data.results[index]),
//                 onTap: () => openDetailPage(snapshot.data, index),
//               ),
//           );
//           //final filme = snapshot.data.results[index];
//         });
//   }
//
//   openDetailPage(ItemModel data, int index) {
//     Navigator.pushNamed(
//       context,'movieDetail', arguments: data.results[index]);
//   }
//
//   Widget _construirCard(filme) {
//     return Card(
//           elevation: 0,
//           clipBehavior: Clip.antiAlias,
//           shadowColor: Colors.white,
//           // shape: RoundedRectangleBorder(
//           //   side: BorderSide(color: Colors.white70, width: 1),
//           //   borderRadius: BorderRadius.circular(0),
//           // ),
//           child:
//               Stack(overflow: Overflow.clip, fit: StackFit.expand, children: [
//             _construirImagemCard(
//                 'https://image.tmdb.org/t/p/w185${filme.poster_path}'),
//             _construirImagemGradienteCard(),
//             _construirVoteAverageCard(filme.vote_average)
//           ]),
//         );
//   }
//
//   Widget _construirImagemCard(String imagem) {
//     return Image.network(
//       imagem,
//       fit: BoxFit.cover,
//     );
//   }
//
//   Widget _construirVoteAverageCard(double rating) {
//     return Positioned(
//       bottom: 10.0,
//       left: 10.0,
//       child: StarRating(
//         color: Colors.white,
//         rating: rating / 2,
//         starCount: 5,
//       ),
//     );
//   }
//
//   Widget _construirImagemGradienteCard() {
//     return Container(
//       height: double.maxFinite,
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: FractionalOffset.topCenter,
//             end: FractionalOffset.bottomCenter,
//             colors: [Colors.transparent, Colors.black87.withOpacity(0.5)]),
//       ),
//     );
//   }
// }
