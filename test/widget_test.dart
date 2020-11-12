import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_helloup/main.dart';

void main() {
  testWidgets('Hello Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('App Flutter'), findsOneWidget);
  });
}
