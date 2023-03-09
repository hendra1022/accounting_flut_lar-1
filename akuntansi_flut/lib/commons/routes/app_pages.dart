import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../modules/customer/customer.dart';
import '../../modules/dashboard/dashboard.dart';
import '../../modules/item/item.dart';
import '../../modules/item/item_detail/item_detail.dart';
import '../../modules/item_category/item_category.dart';
import '../../modules/login/login.dart';
import '../../modules/supplier/supplier.dart';
import '../middlewares/middlewares.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = RoutesPath.init;

  static final routes = [
    GetPage(
      name: RoutesPath.init,
      page: () => Container(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: RoutesPath.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesPath.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesPath.customer,
      page: () => const CustomerPage(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: RoutesPath.item,
      page: () => const ItemPage(),
      binding: ItemBinding(),
    ),
    GetPage(
      name: RoutesPath.itemCategory,
      page: () => const ItemCategoryPage(),
      binding: ItemCategoryBinding(),
    ),
    GetPage(
      name: RoutesPath.supplier,
      page: () => const SupplierPage(),
      binding: SupplierBinding(),
    ),
    GetPage(
      name: RoutesPath.itemDetail,
      page: () => const ItemDetailPage(),
      binding: ItemDetailBinding(),
    ),
  ];
}
