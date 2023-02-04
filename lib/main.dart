import 'package:flutter/material.dart';
import 'package:tijaabooyin/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/get_data.dart';
import 'screens/regis_users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GetData(),
  ));
}
