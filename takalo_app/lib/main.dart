import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:takalo_app/ui/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDCQS2M5Z8xD0z4kvwLbpcqpH8bV5fzA9w",
          authDomain: "takalo-crypto.firebaseapp.com",
          projectId: "takalo-crypto",
          storageBucket: "takalo-crypto.appspot.com",
          messagingSenderId: "74041916249",
          appId: "1:74041916249:web:085bcc6a4e30974d1fea48",
          measurementId: "G-8XTLHWMWRB"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    var materialApp = MaterialApp(
      title: 'Takalo crypto - mobile money',
      home: const Authentication(),
    );
    return materialApp;
  }
}
