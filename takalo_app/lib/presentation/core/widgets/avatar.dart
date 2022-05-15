import 'package:flutter/material.dart';

class Avatara extends StatelessWidget {
  @override
  String img;
  @override
  String name;

  Avatara({Key? key, required String name, required String img})
      : this.img = img,
        this.name = name;

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
        Text(
          name,
          style: TextStyle(
              fontSize: 16, fontFamily: 'avenir', fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
