import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petopia/screens/auth/login_page.dart';

void main() {
  testWidgets('Test basic elements on the login page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    await tester.pumpAndSettle();

    // Cek apakah teks "Login" ada di halaman
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);

    // Cek apakah teks "Forgot Password?" ada di halaman
    expect(find.text('Forgot Password?'), findsOneWidget);

    // Cek apakah tombol "Register" ada di halaman
    expect(find.text('Register'), findsOneWidget);

    // Cek apakah password field ada di halaman
    expect(find.text('Password'), findsOneWidget);
  });
}
