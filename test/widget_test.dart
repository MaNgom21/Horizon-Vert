import 'package:flutter_test/flutter_test.dart';
import 'package:horizon_vert/main.dart';

void main() {
  testWidgets('Application se lance sans erreur', (WidgetTester tester) async {
    await tester.pumpWidget(const ReboisementApp());
    expect(find.text('Horizon Vert'), findsOneWidget);
  });
}
