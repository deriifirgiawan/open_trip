import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'OpenSans',
  useMaterial3: true,
  primaryColor: Color(0xFF007CFF),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  ).copyWith(
    primary: Color(0xFF007CFF),
    secondary: Colors.blueAccent,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF1E1E1E)),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF1E1E1E)),
    titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E1E1E)),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF007CFF),
    titleTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF007CFF), // Warna tombol
      foregroundColor: Colors.white, // Warna teks
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Membuat sudut melengkung
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
  ),
);
