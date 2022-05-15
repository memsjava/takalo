import 'package:flutter/material.dart';

class CoverHome extends StatefulWidget {
  const CoverHome({Key? key}) : super(key: key);

  @override
  _CoverHome createState() => _CoverHome();
}

class _CoverHome extends State<CoverHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/images/sideImg.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "06:22 AM",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/images/cloud.png'),
                              fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "34˚ C",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Text(
                  "Aug 1, 2020 | Wednesday",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
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
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('asset/images/logo.png'),
                                  fit: BoxFit.contain)),
                        ),
                        Text(
                          "Takalo Crypto",
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'ubuntu',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Fanakalozana Ariary-crypto \nElectronic Wallet .\n\nJoin For Free",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: openHomePage,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xffffac30),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 17,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Create an account",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void openHomePage() {
    Navigator.pushNamed(context, '/login');
  }
}
