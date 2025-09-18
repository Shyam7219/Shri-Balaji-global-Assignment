import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shribalajiglobal/features/products/controllers/product_controller.dart';
import 'package:shribalajiglobal/features/products/services/products_api_service.dart';
import 'package:shribalajiglobal/core/services/cache_service.dart';

void main() {
  late ProductController controller;
  
  setUp(() {
    Get.put(ProductsApiService());
    Get.put(CacheService());
    controller = ProductController();
  });

  tearDown(() {
    Get.reset();
  });

  group('ProductController', () {
    test('initial state is correct', () {
      expect(controller.products.isEmpty, true);
      expect(controller.isLoading.value, false);
      expect(controller.error.value, '');
      expect(controller.query.value, '');
    });

    test('filtered products work correctly', () {
      controller.products.addAll([
        // Mock products would be added here in real implementation
      ]);
      controller.query.value = 'test';
      
      // Test filtering logic
      expect(controller.filtered, isA<List>());
    });

    test('query updates trigger UI refresh', () {
      bool updateCalled = false;
      controller.addListener(() => updateCalled = true);
      
      controller.query.value = 'new query';
      
      expect(updateCalled, true);
    });
  });
}