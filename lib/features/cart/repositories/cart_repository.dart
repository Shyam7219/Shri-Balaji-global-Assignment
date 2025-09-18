import '../models/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getItems();
  Future<void> addItem(CartItem item);
  Future<void> removeItem(String itemId);
  Future<void> clearCart();
  Future<double> getTotal();
}