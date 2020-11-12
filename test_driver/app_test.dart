// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_helloup/utils/delay.dart';
import 'package:test/test.dart';

void main() {
  group('Teste', () {
    // final counterTextFinder = find.byValueKey('counter');
    // final buttonFinder = find.byValueKey('increment');
    // expect(await driver.getText(tLogin), "");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('login', () async {
      await driver.runUnsynchronized(() async {
        final title = find.byValueKey('title');
        var tLogin = find.byValueKey('tLogin');
        var tSenha = find.byValueKey('tSenha');
        var btLogin = find.byValueKey('Login');
        var dialogOK = find.byValueKey('dialogOk');

        expect(await driver.getText(title), "App Flutter");

        // Validação login vazio
        await driver.tap(btLogin);
        expect(await driver.getText(dialogOK), "OK");
        await delay(200);
        // fecha dialog
        await driver.tap(dialogOK);

        // Digita Login e Senha
        await driver.tap(tLogin);
        await driver.enterText('user');
        await driver.tap(tSenha);
        await driver.enterText("123");

        // Login
        await driver.tap(btLogin);

        // Tela de Cidades
        var appBar = find.byValueKey('appBar');
        expect(await driver.getText(appBar), "Cidades");
      });
    });

    test('cidades - list - scroll', () async {
      await driver.runUnsynchronized(() async {
        await delay(3000);

        var listView = find.byValueKey('listView');
//        final voltar = find.byTooltip('Back');
//
        // Scroll para baixo
        await driver.scroll(listView, 0, -1500, Duration(milliseconds: 200));
        await delay(200);

        // Scroll para cima
        await driver.scroll(listView, 0, 1800, Duration(milliseconds: 200));
        await delay(200);
      });
    });

    test('cidades - tap', () async {
      await driver.runUnsynchronized(() async {
        var item1 = find.byValueKey("listItem_0");
        var item2 = find.byValueKey("listItem_1");

        // Valida ListView
        expect(await driver.getText(item1), "Lisboa");
        expect(await driver.getText(item2), "Roma");
        await delay(500);

        // Lisboa
        await driver.tap(item1);
        await delay(500);
        var appBar = find.byValueKey('appBar');
        expect(await driver.getText(appBar), "Lisboa");
        await delay(500);

        var back = find.byTooltip('Back');
        await driver.tap(back);
        await delay(500);

        // Roma
        await driver.tap(item2);
        await delay(500);
        appBar = find.byValueKey('appBar');
        expect(await driver.getText(appBar), "Roma");
        await delay(500);

        back = find.byTooltip('Back');
        await driver.tap(back);
        await delay(500);

        // Cidades
        appBar = find.byValueKey('appBar');
        expect(await driver.getText(appBar), "Cidades");
        await delay(500);
      });
    });

    test('logout', () async {
      await driver.runUnsynchronized(() async {
        // Menu Drawer
        final drawer = find.byTooltip('Open navigation menu');
        await driver.tap(drawer);
        await delay(1500);

        // Logout
        var itemLogout = find.byValueKey("Sair");
        await driver.tap(itemLogout);

        await delay(2000);

        // Voltou para o login
        final title = find.byValueKey('title');
        expect(await driver.getText(title), "App Flutter");
      });
    });
  });
}
