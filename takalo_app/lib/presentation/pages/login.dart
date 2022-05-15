// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:takalo_app/application/net/flutterfire.dart';
import 'package:takalo_app/presentation/pages/home.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  // https://ksdvigmajnbmbedidljb.supabase.co
  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtzZHZpZ21ham5ibWJlZGlkbGpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTI2MDQ5OTEsImV4cCI6MTk2ODE4MDk5MX0.LvszI85NeM02Fv06-YtrWzQ2OOjschilCGM_4XY5TUk

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
                            hintStyle: TextStyle(color: Colors.yellow),
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
                            hintStyle: TextStyle(color: Colors.yellow),
                            labelStyle: TextStyle(color: Colors.blue)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 320,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.purple),
                    child: MaterialButton(
                      onPressed: () async {
                        bool shouldNavigate =
                            await signIn(_emailField.text, _passwordField.text);
                        if (shouldNavigate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletHome()),
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: 320,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white),
                    child: MaterialButton(
                      onPressed: () async {
                        bool shouldNavigate = await register(
                            _emailField.text, _passwordField.text);
                        if (shouldNavigate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletHome()),
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
