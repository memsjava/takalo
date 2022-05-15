import 'package:flutter/material.dart';
import 'package:takalo_app/application/net/api_firebase.dart';

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
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton(
          value: dropdownValue,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: coins.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextFormField(
            controller: _amountController,
            decoration:
                const InputDecoration(labelText: "How much of this coin"),
            // keyboardType: TextInputType.text,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.4,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          child: MaterialButton(
            onPressed: () async {
              // var isAdded =
              await addCoin(dropdownValue, _amountController.text);
              // if (isAdded) {
              Navigator.of(context).pop();
              // }
            },
            child: const Text("Add"),
          ),
        ),
      ],
    ));
  }
}
