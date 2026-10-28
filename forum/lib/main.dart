import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:forum/principal.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fórum Educacional",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: Principal(),
    );
  }
}
