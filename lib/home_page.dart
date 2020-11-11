import 'package:flutter/material.dart';
import 'package:flutter_helloup/cidade.dart';
import 'package:flutter_helloup/drawer.dart';
import 'package:flutter_helloup/nav.dart';

import 'cidade_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cidade> list;

  @override
  void initState() {
    super.initState();

    _init();
  }

  _init() async {
    list = await CidadeService().getCidades();
    setState(()  {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cidades"),
        ),
        body: _body(),
        drawer: DrawerList(),
      ),
    );
  }

  _body() {

    return _listView(list);
  }

  _listView(List<Cidade> list) {

    if(list == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: list != null ? list.length : 0,
      itemBuilder: (_, int index) {
        Cidade cidade = list[index];

        return GestureDetector(
          onTap: () => _onClickCidade(cidade),
          child: Container(
            height: 300,
            child: Column(
              children: [
                Text(
                  cidade.nome,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  child: Image.network(cidade.urlFoto),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  _onClickCidade(Cidade c) {
    push(context, CidadePage(c));
  }
}
