import 'package:authentication/ui/authentication/login_screen.dart';
import 'package:authentication/ui/authentication/signup_screen.dart';
import 'package:authentication/ui/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC6SjRd9vDFqqF9TC--9gLUfT2MRGumZmQ",
        appId: "1:758690890683:web:022143414a79cc2b0d7a9e",
        messagingSenderId: "758690890683",
        projectId: "authentication-4ea9a",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
