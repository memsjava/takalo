// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:takalo_app/application/net/flutterfire.dart';

import 'home_view.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/images/logo.png"))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Sign In to get Started",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: Column(children: [
                      TextFormField(
                        controller: _emailField,
                        decoration: const InputDecoration(
                            hintText: 'something@gmail.com',
                            labelText: 'Email',
                            fillColor: Colors.grey,
                            hintStyle: TextStyle(color: Colors.yellow),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordField,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'password',
                            labelText: 'Password',
                            fillColor: Colors.grey,
                            hintStyle: TextStyle(color: Colors.yellow),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 250,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blueGrey),
                    child: MaterialButton(
                      onPressed: () async {
                        bool shouldNavigate =
                            await signIn(_emailField.text, _passwordField.text);
                        if (shouldNavigate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: 250,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white),
                    child: MaterialButton(
                      onPressed: () async {
                        bool shouldNavigate = await register(
                            _emailField.text, _passwordField.text);
                        if (shouldNavigate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()),
                          );
                        }
                      },
                      child: const Text("Register"),
                    ),
                  ),
                ],
              ),
            )));
  }
}
