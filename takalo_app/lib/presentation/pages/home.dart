import 'package:flutter/material.dart';
import 'package:takalo_app/presentation/core/widgets/appbar.dart';
import 'package:takalo_app/presentation/core/widgets/avatar.dart';
import 'package:takalo_app/presentation/pages/deposit.dart';

class WalletHome extends StatelessWidget {
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
            TakaloAppBar(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account Overview",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xfff1f3f6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "20,600",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Current Balance",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffffac30)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddView()),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ))
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
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir'),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/scanqr.png'))),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffffac30),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                  Avatara(
                    img: 'avatar1',
                    name: 'Mike',
                  ),
                  Avatara(
                    img: 'avatar2',
                    name: 'Joseph',
                  ),
                  Avatara(img: 'avatar3', name: 'Ashley'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Services',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir'),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: Icon(Icons.dialpad),
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: [
                  Avatara(img: 'sendMoney', name: 'Send\nMoney'),
                  Avatara(img: 'receiveMoney', name: 'Receive\nMoney'),
                  Avatara(img: 'phone', name: 'Mobile\nRecharge'),
                  Avatara(img: 'electricity', name: 'Electricity\nBill'),
                  Avatara(img: 'tag', name: 'Cashback\nOffer'),
                  Avatara(img: 'movie', name: 'Movie\nTicket'),
                  Avatara(img: 'flight', name: 'Flight\nTicket'),
                  Avatara(img: 'more', name: 'More\n'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
