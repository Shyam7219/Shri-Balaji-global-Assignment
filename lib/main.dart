import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/initial_bindings.dart';
import 'core/routes/app_routes.dart';
import 'features/products/views/product_list_view.dart';
import 'features/products/views/product_detail_view.dart';
import 'features/cart/views/cart_view.dart';
import 'features/theme/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBindings.initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShriBalaji Global Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        themeMode: controller.isDark.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: Routes.PRODUCT_LIST,
        getPages: [
          GetPage(name: Routes.PRODUCT_LIST, page: () => const ProductListView()),
          GetPage(name: Routes.PRODUCT_DETAIL, page: () => ProductDetailView()),
          GetPage(name: Routes.CART, page: () => CartView()),
        ],
      ),
    );
  }
}
