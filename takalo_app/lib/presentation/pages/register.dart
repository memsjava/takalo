// ignore_for_file: prefer_final_fields
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:takalo_app/application/net/api_firebase.dart';
import 'package:takalo_app/presentation/pages/home.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _nameField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _passwordField2 = TextEditingController();

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
                    "takalo crypto",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Container(
                    width: 320,
                    child: Column(children: [
                      TextFormField(
                        controller: _nameField,
                        decoration: const InputDecoration(
                            hintText: 'rakoto',
                            labelText: 'Pseudo',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintStyle: TextStyle(color: Colors.orange),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _emailField,
                        decoration: const InputDecoration(
                            hintText: 'something@gmail.com',
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintStyle: TextStyle(color: Colors.orange),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordField,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintStyle: TextStyle(color: Colors.orange),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordField2,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'password',
                            labelText: 'Password_Confirm',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintStyle: TextStyle(color: Colors.orange),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: 320,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.purple),
                    child: MaterialButton(
                      onPressed: () async {
                        if (_passwordField.text == _passwordField2.text) {
                          bool shouldNavigate = await register(
                              _emailField.text, _passwordField.text);
                          if (shouldNavigate) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletHome()),
                            );
                          } else {
                            if (kDebugMode) {
                              print("password should same");
                            }
                          }
                        }
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
