import '../models/cart_item.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _items = [];

  @override
  Future<List<CartItem>> getItems() async {
    return List.from(_items);
  }

  @override
  Future<void> addItem(CartItem item) async {
    final existingIndex = _items.indexWhere((i) => i.id == item.id);
    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(item);
    }
  }

  @override
  Future<void> removeItem(String itemId) async {
    _items.removeWhere((item) => item.id == itemId);
  }

  @override
  Future<void> clearCart() async {
    _items.clear();
  }

  @override
  Future<double> getTotal() async {
    return _items.fold<double>(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}