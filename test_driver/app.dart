// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
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

    test('teste', () async {
        final title = find.byValueKey('title');

        expect(await driver.getText(title),"Teste");
    });


  });
}