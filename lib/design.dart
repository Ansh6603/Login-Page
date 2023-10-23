import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  const Design({super.key});
  Widget build(context) {
    return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 201, 188, 75),
                Color.fromARGB(255, 219, 146, 36),
                Color.fromARGB(255, 162, 177, 32)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
        );
  }
}
