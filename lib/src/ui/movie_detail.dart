import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final backdroppath;
  final title;
  final originaltitle;
  final votecount;
  final voteaverage;
  final overview;
  final releasedate;

  Detalhes(
      {Key key,
      @required this.backdroppath,
      this.title,
      this.originaltitle,
      this.votecount,
      this.voteaverage,
      this.overview,
      this.releasedate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImagemDetalhes(backdroppath),
          //_construirTituloDetalhes(originaltitle),
          _construirLinhaIconesDetalhes(voteaverage.toString(), '${votecount.toString()} votos'),
          _construirSubtitulosDetalhes('Sinopse'),
          _construirTextoDetalhes(overview),
          _construirSubtitulosDetalhes('Data de lançamento'),
          _construirTextoDetalhes(releasedate)
        ],
      ),
      appBar: _construirAppBar(title),
    );
  }

  Widget _construirImagemDetalhes(String imagem) {
    return Image.network(imagem,
    width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }

  Widget _construirTituloDetalhes(String titulo) {
    return Center(
      child: Text(titulo,
          style: TextStyle(color: Colors.deepOrange, fontSize: 30)),
    );
  }

  Widget _construirSubtitulosDetalhes(String subtitulo) {
    return Center(child: Text(subtitulo, style: TextStyle(fontSize: 20)));
  }

  Widget _construirTextoDetalhes(String texto) {
    return Center(child: Container(padding: EdgeInsets.all(20), child: Text(texto)));
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }

  Widget _construirLinhaIconesDetalhes(String tempo, String rendimento) {
    return Row(
      children: <Widget>[
        _construirColuna(tempo, Icons.star),
        _construirColuna(rendimento, Icons.countertops)
      ],
    );
  }

  Widget _construirColuna(String dado, IconData icone) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Icon(icone, color: Colors.deepOrange),
                Text(dado,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
              ],
            )));
  }
}
