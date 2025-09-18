import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<Product>> getCachedProducts();
  Future<void> cacheProducts(List<Product> products);
}