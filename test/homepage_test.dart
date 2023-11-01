import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petopia/models/petshop_model.dart';
import 'package:petopia/screens/in_app/homepage.dart';

void main() {
  testWidgets('Test basic elements on the home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Cek apakah teks "Petopia" ada di halaman
    expect(find.text('Petopia'), findsOneWidget);

    // Cek apakah tombol chat dan profil ada di halaman
    expect(find.byIcon(Icons.chat_rounded), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    // Cek apakah teks "Hello" dan "Ready for an amazing and lucky experience" ada di halaman
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Ready for an amazing and lucky experience'), findsOneWidget);

    // Cek apakah teks "Services" ada di halaman
    expect(find.text('Services'), findsOneWidget);

    // Cek apakah gambar dan teks masing-masing layanan ada di halaman
    expect(find.byIcon(Icons.chat_rounded), findsOneWidget);
    expect(find.text('Grooming'), findsOneWidget);
    expect(find.byIcon(Icons.local_hospital), findsOneWidget);
    expect(find.text('Emergency'), findsOneWidget);
    expect(find.byIcon(Icons.fastfood), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.byIcon(Icons.hotel), findsOneWidget);
    expect(find.text('Hotel'), findsOneWidget);

    // Cek apakah teks "Pet Shop" ada di halaman
    expect(find.text('Pet Shop'), findsOneWidget);

    // Cek apakah daftar pet shop dengan gambar, teks, dan tombol detail ada di halaman
    expect(find.byType(PetShop), findsWidgets);

    // Cek apakah tombol "Chat Bot" ada di halaman
    // expect(find.text('CHAT BOT HERE'), findsOneWidget);
  });
}
