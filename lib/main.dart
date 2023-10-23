import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/signin_screen .dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp();
  runApp(
    const SignIn(),
  );
}
