import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toga/main.dart';

void main() {
  testWidgets('Toga App Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: TogaApp()));

    // Verify that login screen text is present
    expect(find.text('Continue as Cadet'), findsOneWidget);
  });
}
