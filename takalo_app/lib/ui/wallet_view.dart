import 'package:flutter/material.dart';

class WalletHome extends StatefulWidget {
  const WalletHome({Key? key}) : super(key: key);

  @override
  _WalletHomeState createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/sidebar.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "8:28 AM",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/cloud.png'),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "30 C",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                "May, 05th 2022 | Thursday",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("asset/images/logo.png"),
                              fit: BoxFit.contain)),
                    ),
                    Text(
                      "TAKALO CRYPTO",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Open an account \nDigital E-wallet Solutions \nJoin for free",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )),
              InkWell(
                onTap: openHomePage,
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "sign in",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 17,
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text("Register", style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void openHomePage() {
    Navigator.pushNamed(context, '/walletHome');
  }
}
