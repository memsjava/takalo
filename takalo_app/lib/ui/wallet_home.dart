import 'package:flutter/material.dart';

class HomeWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: walletHome(),
    );
  }
}

class walletHome extends StatefulWidget {
  @override
  _walletHomeState createState() => _walletHomeState();
}

class _walletHomeState extends State<walletHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("asset/images/logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "takalo",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account overview",
              style: TextStyle(
                  fontSize: 21,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xfff1ff3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "20.000",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Current balance",
                          style: TextStyle(fontFamily: "Nunito", fontSize: 16)),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff1ff3),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Send Money",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/qr_scan.png"))),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff1ff3),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                avatarWidget(
                  "avatar1",
                  "mike",
                ),
                avatarWidget(
                  "avatar2",
                  "marc",
                ),
                avatarWidget(
                  "avatar3",
                  "john",
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container avatarWidget(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xfff1ff3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("asset/images/$img.png"),
                  fit: BoxFit.contain),
              border: Border.all(color: Colors.black, width: 2),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontFamily: "Nunito"),
          )
        ],
      ),
    );
  }
}
