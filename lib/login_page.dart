import 'package:flutter/material.dart';

import 'i18n/i18n_en.dart' show en;
import 'i18n/i18n_hi.dart' show hi;

class LoginPage extends StatelessWidget {
  final String currentLang;
  final Function(String) onLangChange;

  const LoginPage({
    super.key,
    required this.currentLang,
    required this.onLangChange,
  });

  Map<String, String> get text =>
      currentLang == 'hi' ? hi : en;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          width: 380,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TITLE
              Text(
                text["login"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // EMAIL
              TextField(
                decoration: InputDecoration(
                  hintText: text["email"],
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // PASSWORD
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: text["password"],
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                  ),
                  onPressed: () {},
                  child: Text(text["login"]!),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {},
                child: Text(
                  text["forgot"]!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const Divider(color: Colors.white24),

              // 🔽 CHANGE LANGUAGE BUTTON WITH OPTIONS
              PopupMenuButton<String>(
                onSelected: onLangChange,
                color: Colors.white,
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  PopupMenuItem(
                    value: 'hi',
                    child: Text('Hindi'),
                  ),
                ],
                child: const Text(
                  "Change Language",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
