import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wastesmart_final/firebase_options.dart';
import 'package:wastesmart_final/pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
