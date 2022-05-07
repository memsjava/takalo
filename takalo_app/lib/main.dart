import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:takalo_app/model/app_state.dart';
import 'package:takalo_app/model/cart_item.dart';
import 'package:takalo_app/reducer/reducers.dart';

import 'package:takalo_app/ui/authentication.dart';
import 'package:takalo_app/ui/cart_list.dart';
import 'package:takalo_app/ui/homapage.dart';
// import 'package:takalo_app/ui/uploadimage.dart';

void main() async {
  List<CartItem> mainItemList = [
    CartItem("IPhone X"),
    CartItem("Samsung Note 5"),
    CartItem("One Plus 7T"),
    CartItem("Redmi Kpro"),
    CartItem("Nokia 7.2"),
  ];

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDCQS2M5Z8xD0z4kvwLbpcqpH8bV5fzA9w",
          authDomain: "takalo-crypto.firebaseapp.com",
          projectId: "takalo-crypto",
          storageBucket: "takalo-crypto.appspot.com",
          messagingSenderId: "74041916249",
          appId: "1:74041916249:web:085bcc6a4e30974d1fea48",
          measurementId: "G-8XTLHWMWRB"));

  final _initialState = AppState(cartItemList: [], mainItemList: mainItemList);
  final Store<AppState> _store =
      Store<AppState>(appStateReducers, initialState: _initialState);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Takalo crypto - mobile money',
        home: const Authentication(),
        routes: {
          '/home': (context) => HomePage(),
          '/cart': (context) => CartList(),
          // '/upload': (context) => UploadImageScreen(),
        },
      ),
    );
  }
}
