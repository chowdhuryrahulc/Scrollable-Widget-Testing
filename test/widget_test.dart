// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:scrollable_widget_testing/main.dart';

// void main() {
//   /* Widget (Component testing)
//   Scroll and test behaviour
//   Check screan size and check behaviour
//   In case of error while creating widget

// Check if first book is in view

//   */
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // ASSEMBLE (initilize using pumpwidget)
//     // pumpWidget makes whole widget tree rebuild.
//     // pump: only updtes widgets that has changed with new value.
//     // Can set duration in both pump and pumpWidget. (After that duration rebuild will start)
//     //
//     await tester.pumpWidget(const MyApp());

// // expect is a matcher. Checks value and equates it
// // findsOneWidget, findsNothing, findsNWidgets(n),
// // goldenFileComparator for image testing
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

// // ACT (use find to find stuff in widget tree)
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

// // ASSERT
//     // expect(find.text('0'), go);
//     // expect(find.text('1'), );
//   });
// }
