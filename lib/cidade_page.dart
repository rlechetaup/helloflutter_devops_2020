import 'package:flutter/material.dart';
import 'package:flutter_helloup/cidade.dart';

class CidadePage extends StatelessWidget {
  final Cidade cidade;

  CidadePage(this.cidade);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cidade.nome,
          key: Key('appBar'),
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Image.network(
        cidade.urlFoto,
      ),
    );
  }
}
