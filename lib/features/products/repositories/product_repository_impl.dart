import '../models/product.dart';
import '../services/products_api_service.dart';
import '../../../core/services/cache_service.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsApiService _apiService;
  final CacheService _cacheService;

  ProductRepositoryImpl({
    required ProductsApiService apiService,
    required CacheService cacheService,
  }) : _apiService = apiService, _cacheService = cacheService;

  @override
  Future<List<Product>> getProducts() async {
    try {
      final products = await _apiService.fetchProducts();
      await cacheProducts(products);
      return products;
    } catch (e) {
      return await getCachedProducts();
    }
  }

  @override
  Future<List<Product>> getCachedProducts() async {
    final cached = _cacheService.getCachedProducts();
    if (cached == null) return [];
    return cached.map<Product>((m) => Product.fromJson(Map<String, dynamic>.from(m))).toList();
  }

  @override
  Future<void> cacheProducts(List<Product> products) async {
    await _cacheService.saveProducts(products.map((e) => e.toJson()).toList());
  }
}