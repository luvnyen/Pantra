import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantra_project/pages/home.dart';
import 'package:pantra_project/pages/register.dart';
import 'package:pantra_project/utils/color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final auth = FirebaseAuth.instance;
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message.toString();
    }
  }

  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 234, 213, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Namaste",
              style: TextStyle(
                fontSize: 30,
                color: primary,
                fontFamily: 'Recoleta',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                  labelText: "NRP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                    //make the border transparent
                  ),
                  fillColor: const Color.fromRGBO(253, 205, 95, 1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(253, 126, 20, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                    //make the border transparent
                  ),
                  fillColor: const Color.fromRGBO(253, 205, 95, 1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(253, 126, 20, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String username = _accountController.text;
                  String password = _passwordController.text;
                  String email = username + "@john.petra.ac.id";
                  login(email: email, password: password).then((value) {
                    value == "Success"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Invalid NRP or Password. Please try again."),
                            ),
                          );
                    ;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Recoleta'),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            //register
            Text("Don't have an account?",
                style: TextStyle(
                  fontSize: 20,
                  color: primary,
                  fontFamily: 'Recoleta',
                )),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Recoleta'),
                ),
              ),
            ),
            const Text(
              "est. MMXXII",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
