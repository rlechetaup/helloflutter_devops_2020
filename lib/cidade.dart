import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Cidade {
  int id;
  String nome;
  String urlFoto;

  Cidade({this.id, this.nome, this.urlFoto});

  Cidade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    urlFoto = json['urlFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['urlFoto'] = this.urlFoto;
    return data;
  }
}


class CidadeService {
  Future<List<Cidade>> getCidades() async {
    List<Cidade> list = [];

    var url = 'https://www.mocky.io/v2/5db35e0a300000500057b628';

  // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      var cidades = jsonResponse.map<Cidade>((json) => Cidade.fromJson(json)).toList();

      list.addAll(cidades);
      list.addAll(cidades);
      list.addAll(cidades);
      list.addAll(cidades);
      list.addAll(cidades);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    // for (int i = 0; i < 50; i++) {
    //   list.add(
    //     Cidade.abacaxi(
    //       i % 2 == 0 ? "Lisboa $i" : "Roma $i",
    //       i % 2 == 0
    //           ? "http://download.livetouchdev.com.br/lecheta/cidades/lisboa.jpg"
    //           : "http://download.livetouchdev.com.br/lecheta/cidades/roma.jpg",
    //     ),
    //   );
    // }

    return list;
  }
}
