import 'package:flutter/material.dart';
import 'package:login/design.dart';
import 'package:login/image.dart';
import 'package:login/home_screen.dart';
import 'package:login/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

//   //The TextEditingController is a Flutter class that helps in managing and controlling the text entered in a TextFormField widget. It provides functionality to retrieve the entered text, set initial text, listen for text changes, and clear the text.
//   //In the given code, we use TextEditingController to control the text input for the email and password fields
//   //Retrieving the entered text: By using a controller, we can easily retrieve the text entered by the user. For example, when the sign-in button is pressed, we can access the email and password entered by accessing the text property of the respective controllers (_emailController.text and _passwordController.text).
//   //Setting initial text: If you want to set an initial value for the email or password fields, you can do so by setting the text property of the respective controller. For example, you can set an initial email value when the controller is initialized, like _emailController = TextEditingController(text: "example@email.com");
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // The dispose() method is called when a stateful widget is removed from the widget tree, typically when the associated screen or route is no longer visible.
    // Freeing up resources: The TextEditingController instances hold references to the text fields and their associated listeners. When a widget is disposed, it is important to release these resources to avoid memory leaks.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const Design(),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      logoTanker('assest/images/t.jpg'),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        //decoration: BoxDecoration,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person_outlined,
                            ),
                            labelText: 'Enter Email',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              //color: Colors.white,
                            ),
                            labelText: 'Enter Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then(
                              (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                            ).onError(
                              (error, stackTrace) {
                                print("Error ${error.toString()}");
                              },
                            );
                          },
                          child: const Text('Log In'),
                        );
                      }),
                      //Wrap the widget tree where you use the Navigator with a Builder widget:
                      //  Navigator.push is used to navigate to the HomeScreen when the "Sign In" button is pressed.
                      //The Navigator.push method is a common way to navigate between screens in Flutter. It allows you to transition from one screen to another, maintaining a history of routes that can be managed using various navigation methods provided by the Navigator class.

                      //The context parameter is passed to Navigator.push, which is required to access the current navigation context.
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Dont have Account?',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Builder(
                              builder: (context) {
                                return ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()),
                                    );
                                  },
                                  child: const Text('Sign Up'),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
//                           //const Design(),
          ],
        ),
      ),
    );
  }
}
