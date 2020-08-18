import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:independent_view_sample/counter/count_controller.dart';
import 'package:independent_view_sample/counter/counter_page.dart';

void main() {
  testWidgets(
      '$CounterPage should Show $CircularProgressIndicator when $CountState#loading is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          counterControllerProvider.state.overrideWithValue(
            /// loading is true
            CountState(loading: true),
          ),
        ],
        child: MaterialApp(home: CounterPage()),
      ),
    );

    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
