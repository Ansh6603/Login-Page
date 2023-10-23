import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/signin_screen .dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellowAccent, Colors.orangeAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.center,
          ),
        ),
        child: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print:
                  'Signed-Out';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                });
              },
              child: const Text('Log-Out'),
            );
          }),
        ),
      ),
    );
  }
}
