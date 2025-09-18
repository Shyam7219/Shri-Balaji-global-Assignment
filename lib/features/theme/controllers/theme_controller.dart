import 'package:get/get.dart';
import '../../../core/services/cache_service.dart';

class ThemeController extends GetxController {
  final CacheService cacheService;
  final RxBool isDark = false.obs;

  ThemeController({required this.cacheService});

  @override
  void onInit() {
    super.onInit();
    final saved = cacheService.getSavedTheme();
    if (saved != null) isDark.value = saved;
  }

  void toggleTheme() {
    isDark.value = !isDark.value;
    cacheService.saveTheme(isDark.value);
    update();
  }
}
