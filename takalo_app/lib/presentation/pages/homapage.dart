import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:takalo_app/reducer/actions.dart';

import '../core/model/app_state.dart';
import '../core/model/cart_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, List<CartItem>>(
      converter: (mainItemStore) => mainItemStore.state.mainItemList,
      builder: (context, list) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Redux Example"),
            actions: <Widget>[
              Center(
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/cart"),
                  child: SizedBox(
                    width: 30,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        const Align(child: const Icon(Icons.shopping_cart)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: StoreConnector<AppState, List<CartItem>>(
                                converter: (store) => store.state.cartItemList,
                                builder: (context, list) {
                                  return Text(
                                    list.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, position) {
                return Card(
                    child: ListTile(
                  title: Text(list[position].itemName),
                  trailing: InkWell(
                      onTap: () {
                        state.dispatch(AddCartItemAction(list[position]));
                        final snackBar = SnackBar(
                            content: Text(
                                "${list[position].itemName} added into cart"));
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                      child: const Icon(Icons.add_circle)),
                ));
              }),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushNamed("/upload");
              },
              label: const Text("Upload")),
        );
      },
    );
  }
}
