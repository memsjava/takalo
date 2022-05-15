import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:takalo_app/application/net/api_firebase.dart';
import 'package:takalo_app/presentation/pages/cover.dart';

class TakaloAppBar extends StatelessWidget {
  const TakaloAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('asset/images/logo.png'),
                )),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Takalo crypto",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'ubuntu', fontSize: 25),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: PopupMenuButton<int>(
                  offset: const Offset(0, 48),
                  child: Container(
                    margin: EdgeInsets.all(17),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/menu.png'))),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(children: [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text("Sign Out"),
                      ]),
                    ),
                  ],
                  onSelected: (item) => SelectedItem(context, item),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> SelectedItem(BuildContext context, item) async {
    switch (item) {
      case 0:
        if (kDebugMode) {
          print("User Logged out");
        }
        bool isloggedOut = await signOut();
        if (isloggedOut) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CoverHome()),
          );
        }
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => SettingPage()));
        break;
    }
  }
}
