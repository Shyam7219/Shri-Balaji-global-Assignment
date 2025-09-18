import '../repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  Future<void> call() async {
    await _repository.clearCart();
  }
}