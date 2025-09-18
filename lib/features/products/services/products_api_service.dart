import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../../../core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';

class ProductsApiService {
  static const _headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'ShriBalaji-Store-App',
  };

  Future<List<Product>> fetchProducts() async {
    if (kDebugMode) print('Fetching products from API');
    
    final resp = await http.get(
      Uri.parse('${AppConstants.baseUrl}/products'),
      headers: _headers,
    ).timeout(AppConstants.apiTimeout);
    
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body) as List;
      if (kDebugMode) print('Parsed ${data.length} products');
      return data.map((e) => Product.fromJson(e)).toList();
    }
    throw Exception('API Error: ${resp.statusCode}');
  }


}
