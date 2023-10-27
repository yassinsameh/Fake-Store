import 'package:fake_store/products_feature/all_products.dart';
import 'package:fake_store/products_feature/product_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../products_feature/cart.dart';
import '../products_feature/models/product.dart';
import '../products_feature/root.dart';

final routerProvider = Provider((ref) {
  return RouterHandler();
});

class RouterHandler {
  final router = GoRouter(
    initialLocation: '/${Root.name}',
    routes: [
      GoRoute(
        path: '/${Root.name}',
        name: Root.name,
        builder: (context, state) => const Root(),
      ),
      GoRoute(
        path: '/${AllProducts.name}',
        name: AllProducts.name,
        builder: (context, state) => const AllProducts(),
      ),
      GoRoute(
        path: '/${Cart.name}',
        name: Cart.name,
        builder: (context, state) => const Cart(),
      ),
      GoRoute(
        path: '/${ProductDetails.name}',
        name: ProductDetails.name,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetails(product: product);
        },
      ),
    ],
  );
}
