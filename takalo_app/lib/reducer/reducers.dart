import 'package:takalo_app/model/app_state.dart';
import 'package:takalo_app/model/cart_item.dart';
import 'package:takalo_app/reducer/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddCartItemAction) {
    return addCartItem(state.cartItemList, state.mainItemList, action);
  } else if (action is RemoveCartItemAction) {
    return removeCartItem(state.cartItemList, state.mainItemList, action);
  }
  return state;
}

AppState addCartItem(
    List<CartItem> items, List<CartItem> mainItems, AddCartItemAction action) {
  return AppState(
      cartItemList: List.from(items)..add(action.cartItem),
      mainItemList: List.from(mainItems)
        ..removeWhere((item) => item.itemName == action.cartItem.itemName));
}

AppState removeCartItem(List<CartItem> items, List<CartItem> mainItems,
    RemoveCartItemAction action) {
  return AppState(
      cartItemList: List.from(items)
        ..removeWhere((item) => item.itemName == action.cartItem.itemName),
      mainItemList: List.from(mainItems)..add(action.cartItem));
}
