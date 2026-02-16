import 'package:flutter_test/flutter_test.dart';
import 'package:mini_restoran_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniRestoranApp());
    expect(find.text('Lezzet Durağı'), findsOneWidget);
  });
}
