import 'package:flutter/material.dart';
import 'package:flutter_helloup/home_page.dart';
import 'package:flutter_helloup/login_model.dart';
import 'package:flutter_helloup/nav.dart';
import 'package:flutter_helloup/utils/alert.dart';
import 'package:flutter_helloup/widgets/app_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tLogin = TextEditingController();
  var tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Teste"),
      ),*/
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Center(
            child: Text(
              "App Flutter",
              key: Key('title'),
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
          Text(
            "Login",
             key: Key('login'),
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
          TextFormField(
            controller: tLogin,
            key: Key('tlogin'),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                hintText: 'Digite o login'
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Senha",
            key: Key('senha'),
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          TextFormField(
            key: Key('tsenha'),
            controller: tSenha,
            obscureText: true,
          ),
          SizedBox(height: 20,),
          AppButton("Login", _onClickLogin),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton("Cadastrar", _onClickCadastrar),
              AppButton("EsqueciSenha", _onClickEsqueciSenha),
            ],
          )

        ],
      ),
    );
  }

  void _onClickLogin() {
    print("login");

    var model = LoginModel();
    model.login = tLogin.text;
    model.senha = tSenha.text;

    print("Login: ${model.login}: ${model.senha}");

    if(model.login == "user" && model.senha == "123") {
      push(context, HomePage());
    } else {
      alert(context, "Login / Senha incorretos");
    }
  }

  _onClickCadastrar() {
    print("cadastrar");
  }

  _onClickEsqueciSenha() {
    print("Esqueci a senha");
  }
}
