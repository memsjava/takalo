import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:takalo_app/reducer/actions.dart';

import '../core/model/app_state.dart';
import '../core/model/cart_item.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, List<CartItem>>(
      converter: (cartItemStore) => cartItemStore.state.cartItemList,
      builder: (context, list) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
          ),
          body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, position) {
                return Card(
                    child: ListTile(
                  title: Text(list[position].itemName),
                  trailing: InkWell(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                                  content: Text(
                                      "Are you sure, you want to remove ${list[position].itemName} from cart ?"),
                                  actions: <Widget>[
                                    CupertinoButton(
                                        child: const Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    CupertinoButton(
                                        child: const Text("Remove"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          state.dispatch(RemoveCartItemAction(
                                              list[position]));
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  "${list[position].itemName} removed from cart"));

                                          Scaffold.of(context)
                                              .showSnackBar(snackBar);
                                        })
                                  ],
                                ));
                      },
                      child: const Icon(Icons.delete)),
                ));
              }),
        );
      },
    );
  }
}
