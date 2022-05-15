import 'package:flutter/material.dart';
import 'package:takalo_app/application/net/api_firebase.dart';
import 'package:takalo_app/presentation/core/widgets/addbar.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = ["bitcoin", "litecoin", "ethereum", "dogecoin"];
  String dropdownValue = "bitcoin";
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TakaloAddBar(),
            Text(
              "Choose an account",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir'),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('asset/images/mm.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('asset/images/cloud.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xfff1f3f6),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Enter Details:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    DropdownButton(
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items:
                          coins.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: _amountController,
                        decoration: const InputDecoration(labelText: "amount"),
                        // keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.purple),
                      child: MaterialButton(
                        onPressed: () async {
                          // var isAdded =
                          await addCoin(dropdownValue, _amountController.text);
                          // if (isAdded) {
                          Navigator.of(context).pop();
                          // }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xfff1f3f6),
                // borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                "Instruction:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
