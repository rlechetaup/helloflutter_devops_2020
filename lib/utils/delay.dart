
Future<void> delay([int milliseconds = 250]) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}