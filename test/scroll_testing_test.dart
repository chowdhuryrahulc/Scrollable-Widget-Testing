import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrollable_widget_testing/main.dart';

void main() {
  group('ScrollTestingWidget', () {
    testWidgets('should not scroll with less items',
        (WidgetTester tester) async {
      // Put all the parent widgets inside pumpWidgets
      await tester.pumpWidget(MaterialApp(
          home: ScrollTestingWidget(
              bookTitle: List.generate(5, (index) => 'Book $index'))));

      // For Scroll Widgets
      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump(); // Rebuilds widgets.

// Check if we havnt scrolled. So first listTile must be vissible
      final firstBookFinder = find.text('Book 0');
      expect(firstBookFinder, findsOneWidget);
    });

    testWidgets('should not scroll with a lot of items',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: ScrollTestingWidget(
              bookTitle: List.generate(200, (index) => 'Book $index'))));

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text('Book 0');
      final eleventhBookFinder =
          find.text('Book 11'); // Findind out book in between
      expect(firstBookFinder, findsNothing);
      expect(eleventhBookFinder,
          findsOneWidget); // The Widget that we have scrolled to.

      // To find out the number of Widgets present in the Screan currently.
      final listTileFinder = find.byType(ListTile);
      expect(listTileFinder, findsNWidgets(11));
    });

    // Testing for different ScreanSizes
    testWidgets('should show only 2 Widgets in smaller screenSize',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue =
          const Size(320, 350); // Reducing Screen size to 320,350

      await tester.pumpWidget(MaterialApp(
          home: ScrollTestingWidget(
              bookTitle: List.generate(200, (index) => 'Book $index'))));

      expect(find.byType(ListTile), findsNWidgets(2));
    });

// Assersion error check
// What is AssersionError?
//! IMPORTANT
    testWidgets('should throw error is empty list is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: ScrollTestingWidget(bookTitle: [])));

      // assert inside main.dart checks if the list is not empty
      expect(tester.takeException(), isAssertionError);
    });
  });
}
