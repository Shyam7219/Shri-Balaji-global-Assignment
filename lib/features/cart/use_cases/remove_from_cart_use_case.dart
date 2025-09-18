import '../repositories/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository _repository;

  RemoveFromCartUseCase(this._repository);

  Future<void> call(String itemId) async {
    await _repository.removeItem(itemId);
  }
}