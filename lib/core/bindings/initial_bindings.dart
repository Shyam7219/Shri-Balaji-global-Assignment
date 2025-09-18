import 'package:get/get.dart';
import '../services/cache_service.dart';
import '../../features/products/services/products_api_service.dart';
import '../../features/products/controllers/product_controller.dart';
import '../../features/cart/controllers/cart_controller.dart';
import '../../features/cart/repositories/cart_repository.dart';
import '../../features/cart/repositories/cart_repository_impl.dart';
import '../../features/cart/use_cases/add_to_cart_use_case.dart';
import '../../features/cart/use_cases/remove_from_cart_use_case.dart';
import '../../features/cart/use_cases/clear_cart_use_case.dart';
import '../../features/cart/use_cases/get_cart_items_use_case.dart';
import '../../features/theme/controllers/theme_controller.dart';

class InitialBindings {
  static Future<void> initServices() async {
    final cache = CacheService();
    await cache.init();
    Get.put<CacheService>(cache, permanent: true);

    // feature services/controllers
    Get.put<ProductsApiService>(ProductsApiService(), permanent: true);
    Get.put<CartRepository>(CartRepositoryImpl(), permanent: true);

    // Use cases
    Get.put<AddToCartUseCase>(AddToCartUseCase(Get.find<CartRepository>()), permanent: true);
    Get.put<RemoveFromCartUseCase>(RemoveFromCartUseCase(Get.find<CartRepository>()), permanent: true);
    Get.put<ClearCartUseCase>(ClearCartUseCase(Get.find<CartRepository>()), permanent: true);
    Get.put<GetCartItemsUseCase>(GetCartItemsUseCase(Get.find<CartRepository>()), permanent: true);

    Get.put<ThemeController>(ThemeController(cacheService: cache), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}
