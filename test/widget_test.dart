// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:secondapp/main.dart';

void main() {
  testWidgets('Login and navigation test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(SocialOrgApp());

    // Verify we are on Login Page
    expect(find.text('Login'), findsOneWidget);

    // Enter non-admin credentials and login
    await tester.enterText(find.byType(TextField).first, 'user@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Expect to be on Home Page
    expect(find.text('Members'), findsOneWidget);

    // Go back to Login Page
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Enter 'admin' to test admin login
    await tester.enterText(find.byType(TextField).first, 'admin');
    await tester.enterText(find.byType(TextField).last, 'adminpass');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Expect to be on Admin Page
    expect(find.text('Admin Panel'), findsOneWidget);

    // Go back to Login Page
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Tap "No account? Sign up"
    await tester.tap(find.text('No account? Sign up'));
    await tester.pumpAndSettle();

    // Expect to be on SignUp Page
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
