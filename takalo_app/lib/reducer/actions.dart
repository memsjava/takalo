import 'package:takalo_app/presentation/core/model/cart_item.dart';

class AddCartItemAction {
  final CartItem cartItem;

  AddCartItemAction(this.cartItem);
}

class RemoveCartItemAction {
  final CartItem cartItem;

  RemoveCartItemAction(this.cartItem);
}

class AddMainItemAction {
  final CartItem cartItem;

  AddMainItemAction(this.cartItem);
}

class RemoveMainItemAction {
  final CartItem cartItem;

  RemoveMainItemAction(this.cartItem);
}
