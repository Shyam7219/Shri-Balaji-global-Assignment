import '../models/cart_item.dart';
import '../repositories/cart_repository.dart';
import '../../products/models/product.dart';

class AddToCartUseCase {
  final CartRepository _repository;

  AddToCartUseCase(this._repository);

  Future<void> call(Product product) async {
    final cartItem = CartItem(
      id: product.id.toString(),
      product: product,
      quantity: 1,
    );
    await _repository.addItem(cartItem);
  }
}