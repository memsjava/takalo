import 'cart_item.dart';

class AppState {
  List<CartItem> cartItemList = <CartItem>[];
  List<CartItem> mainItemList = <CartItem>[];

  AppState({required this.cartItemList, required this.mainItemList});

  AppState.fromAppState(AppState another) {
    cartItemList = another.cartItemList;
    mainItemList = another.mainItemList;
  }
}
