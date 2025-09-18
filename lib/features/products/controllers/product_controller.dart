import 'package:get/get.dart';
import '../../products/models/product.dart';
import '../../products/services/products_api_service.dart';
import '../../../core/services/cache_service.dart';
import 'package:flutter/foundation.dart';

class ProductController extends GetxController {
  final ProductsApiService _api = Get.find();
  final CacheService _cache = Get.find();
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final RxString query = ''.obs;

  List<Product> get filtered {
    final q = query.value.toLowerCase().trim();
    if (q.isEmpty) return products;
    return products.where((p) => p.title.toLowerCase().contains(q)).toList();
  }

  @override
  void onInit() {
    super.onInit();
    query.listen((_) => update());
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    error.value = '';
    update();
    try {
      final list = await _api.fetchProducts();
      products.assignAll(list);
      await _cache.saveProducts(list.map((e) => e.toJson()).toList());
      error.value = '';
    } catch (e, st) {
      if (kDebugMode) {
        print('fetchProducts error: $e');
        print(st);
      }
      
      final cached = _cache.getCachedProducts();
      if (cached != null && cached.isNotEmpty) {
        try {
          final list = cached.map<Product>((m) => Product.fromJson(Map<String, dynamic>.from(m))).toList();
          products.assignAll(list);
          error.value = 'Using offline data. Pull to refresh when online.';
        } catch (_) {
          _loadSampleProducts();
          error.value = 'Network error. Showing sample products.';
        }
      } else {
        _loadSampleProducts();
        error.value = 'No internet connection. Showing sample products.';
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }
  
  void _loadSampleProducts() {
    products.assignAll([
      Product(
        id: 1,
        title: 'Premium Wireless Headphones',
        price: 29.99,
        description: 'High-quality wireless headphones with noise cancellation and premium sound quality.',
        category: 'electronics',
        image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300',
        rating: Rating(rate: 4.5, count: 120),
      ),
      Product(
        id: 2,
        title: 'Smart Fitness Watch',
        price: 199.99,
        description: 'Advanced fitness tracking with heart rate monitor, GPS, and smartphone connectivity.',
        category: 'electronics',
        image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300',
        rating: Rating(rate: 4.2, count: 89),
      ),
      Product(
        id: 3,
        title: 'Cotton Casual T-Shirt',
        price: 19.99,
        description: 'Comfortable 100% cotton t-shirt perfect for everyday casual wear.',
        category: 'clothing',
        image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300',
        rating: Rating(rate: 4.0, count: 156),
      ),
      Product(
        id: 4,
        title: 'Leather Wallet',
        price: 49.99,
        description: 'Genuine leather wallet with multiple card slots and bill compartment.',
        category: 'accessories',
        image: 'https://images.unsplash.com/photo-1627123424574-724758594e93?w=300',
        rating: Rating(rate: 4.3, count: 78),
      ),
    ]);
  }
}
