import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/order_details/screens/order_details.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/main.dart';
import 'package:amazon_clone/model/order.dart';
import 'package:amazon_clone/model/product.dart';

import 'package:amazon_clone/utility/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routerSeting) {
  switch (routerSeting.name) {
    case MyApp.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const MyApp();
        },
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const AuthScreen();
        },
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const HomeScreen();
        },
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const BottomBar();
        },
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
      );
    case CategoryDealsScreen.routeName:
      var category = routerSeting.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryDealsScreen(category: category),
      );
    case ProductDetailScreen.routeName:
      var product = routerSeting.arguments as Product;
      return MaterialPageRoute(
        settings: routerSeting,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routerSeting.arguments as String;
      return MaterialPageRoute(
        settings: routerSeting,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routerSeting.arguments as String;
      return MaterialPageRoute(
        settings: routerSeting,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routerSeting.arguments as Order;
      return MaterialPageRoute(
        settings: routerSeting,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Text(
            "404 Page Not Found !!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }
}
