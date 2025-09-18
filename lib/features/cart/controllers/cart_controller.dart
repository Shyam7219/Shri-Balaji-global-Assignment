import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../products/models/product.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/price_formatter.dart';

class CartController extends GetxController {
  final RxList<Product> items = <Product>[].obs;

  void addToCart(Product p) {
    items.add(p);
    update();
    Get.snackbar(
      'Added to Cart',
      '${_truncateTitle(p.title)}\n${PriceFormatter.formatWithUSD(p.price)}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.primaryColor,
      colorText: Get.theme.colorScheme.onPrimary,
      duration: AppConstants.snackbarDuration,
      margin: const EdgeInsets.all(AppConstants.defaultPadding),
      borderRadius: AppConstants.buttonRadius,
      icon: const Icon(Icons.shopping_cart, color: Colors.white),
    );
  }

  void removeFromCart(Product p) {
    items.remove(p);
    update();
  }

  double get total => items.fold(0.0, (sum, p) => sum + p.price);
  
  String _truncateTitle(String title) {
    return title.length > 25 ? '${title.substring(0, 25)}...' : title;
  }

  int get itemCount => items.length;

  void clear() {
    items.clear();
    update();
  }
}
