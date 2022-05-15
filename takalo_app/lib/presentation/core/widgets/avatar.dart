import 'package:flutter/material.dart';

class Avatara extends StatelessWidget {
  var img;

  Avatara({Key? key, required String img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('asset/images/$img.png'),
                  fit: BoxFit.contain),
              border: Border.all(color: Colors.black, width: 2)),
        ),
      ],
    );
  }
}
