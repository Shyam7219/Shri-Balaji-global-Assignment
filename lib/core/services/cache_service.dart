import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const _cachedProductsKey = 'cached_products';
  static const _themeKey = 'is_dark_theme';
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveProducts(List<Map<String, dynamic>> products) async {
    await _prefs.setString(_cachedProductsKey, jsonEncode(products));
  }

  List<dynamic>? getCachedProducts() {
    final s = _prefs.getString(_cachedProductsKey);
    if (s == null) return _getSampleProducts();
    try {
      return jsonDecode(s) as List<dynamic>;
    } catch (e) {
      return _getSampleProducts();
    }
  }

  List<dynamic> _getSampleProducts() {
    return [
      {
        "id": 1,
        "title": "Premium Wireless Headphones",
        "price": 299.99,
        "description": "High-quality wireless headphones with noise cancellation and premium sound quality. Perfect for music lovers and professionals.",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
        "rating": {"rate": 4.8, "count": 256}
      },
      {
        "id": 2,
        "title": "Classic Cotton T-Shirt",
        "price": 24.99,
        "description": "Comfortable and stylish cotton t-shirt available in multiple colors. Made from 100% organic cotton.",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        "rating": {"rate": 4.2, "count": 189}
      },
      {
        "id": 3,
        "title": "Elegant Gold Necklace",
        "price": 159.99,
        "description": "Beautiful 18k gold plated necklace with elegant design. Perfect for special occasions.",
        "category": "jewelery",
        "image": "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
        "rating": {"rate": 4.6, "count": 94}
      },
      {
        "id": 4,
        "title": "Women's Summer Dress",
        "price": 79.99,
        "description": "Lightweight and comfortable summer dress perfect for casual outings and beach vacations.",
        "category": "women's clothing",
        "image": "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
        "rating": {"rate": 4.4, "count": 167}
      }
    ];
  }

  Future<void> saveTheme(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
  }

  bool? getSavedTheme() {
    return _prefs.getBool(_themeKey);
  }
}
