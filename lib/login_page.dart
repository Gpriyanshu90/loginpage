import 'package:flutter/material.dart';


/// LANGUAGE MAP

Map<String, Map<String, String>> translations = {
  'en': {
    'login': 'Login',
    'email': 'Email',
    'password': 'Password',
    'forgot': 'Forgot Password?',
    'change_lang': 'Change Language',
    'english': 'English',
    'hindi': 'Hindi',
  },
  'hi': {
    'login': 'लॉगिन',
    'email': 'ईमेल',
    'password': 'पासवर्ड',
    'forgot': 'पासवर्ड भूल गए?',
    'change_lang': 'भाषा बदलें',
    'english': 'अंग्रेज़ी',
    'hindi': 'हिंदी',
  },
};


/// TRANSLATION FUNCTION

String tr(String key, String lang) {
  return translations[lang]?[key] ?? key;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  String currentLang = 'en'; // default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(

          width: 500,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// TITLE

              Text(
                tr('login', currentLang),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),


              /// EMAIL

              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: tr('email', currentLang),
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),


              /// PASSWORD

              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: tr('password', currentLang),
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),


              /// LOGIN BUTTON

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    tr('login', currentLang),
                    style: const TextStyle(fontSize: 18,color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),


              /// FORGOT PASSWORD

              TextButton(
                onPressed: () {},
                child: Text(
                  tr('forgot', currentLang),
                  style: const TextStyle(color: Colors.white,
                    decoration: TextDecoration.underline,),

                ),
              ),


              /// CHANGE LANGUAGE (POPUP)

              PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    currentLang = value;
                  });
                },
                color: Colors.white,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'en',
                    child: Text(
                      tr('english', currentLang),
                      style:  TextStyle(color: Colors.black,
                        decoration: TextDecoration.underline,),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'hi',
                    child: Text(
                      tr('hindi', currentLang),
                      style:  TextStyle(color: Colors.black,
                        decoration: TextDecoration.underline,),

                    ),
                  ),
                ],
                child: Text(
                  tr('change_lang', currentLang),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
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
