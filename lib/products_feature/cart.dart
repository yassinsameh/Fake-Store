import 'package:fake_store/component_widgets/product_tile.dart';
import 'package:fake_store/core/error_screen.dart';
import 'package:fake_store/products_feature/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/palette.dart';
import '../core/theme.dart';
import '../storage/storage_service.dart';
import 'models/product.dart';

class Cart extends ConsumerStatefulWidget {
  static const name = "cart";

  const Cart({super.key});

  @override
  CartState createState() => CartState();
}

class CartState extends ConsumerState<Cart> {
  @override
  void initState() {
    Future.microtask(() => ref.read(cartBoxProvider));
    super.initState();
  }

  bool updatingCart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Palette.primaryColor1,
          title: Text(
            "Fake Store",
            style: AppTheme.textThemes.titleMedium,
          ),
        ),
        body: ref.watch(cartFutureProvider).when(
            data: (results) {
              if (results.isEmpty) {
                return Center(
                  child: Text(
                    "Your cart is empty",
                    style: AppTheme.textThemes.titleLarge,
                  ),
                );
              }
              final products = ref
                      .watch(productsControllerProvider)
                      .products
                      .asData
                      ?.value ??
                  [];

              // final products = box.values.toList().cast<Product>();
              return Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: results.keys.length,
                        itemBuilder: (context, index) {
                          final int productId = results.keys.elementAt(index);
                          final quantity = results[productId]!;
                          Product? product;
                          for (final fetchedProduct in products) {
                            if (fetchedProduct.id == productId) {
                              product = fetchedProduct;
                              break;
                            }
                          }

                          if (product == null) {
                            return const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator());
                          }

                          return ProductTile(
                              onTap: () {},
                              product: product,
                              isLoading: updatingCart,
                              onPressedAddition: () async {
                                try {
                                  if (updatingCart) return;
                                  setState(() {
                                    updatingCart = true;
                                  });
                                  await Future.delayed(
                                      Duration(milliseconds: 500));
                                  await ref
                                      .read(productsControllerProvider.notifier)
                                      .updateCart(
                                          selectedProduct: product!.id,
                                          quantity: 1,
                                          adding: true);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                } finally {
                                  setState(() {
                                    updatingCart = false;
                                  });
                                }
                              },
                              onPressedSubtraction: () async {
                                try {
                                  if (updatingCart) return;
                                  setState(() {
                                    updatingCart = true;
                                  });
                                  await Future.delayed(
                                      Duration(milliseconds: 500));

                                  await ref
                                      .read(productsControllerProvider.notifier)
                                      .updateCart(
                                          selectedProduct: product!.id,
                                          quantity: 1,
                                          adding: false);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                } finally {
                                  setState(() {
                                    updatingCart = false;
                                  });
                                }
                              },
                              quantitySelected: quantity);
                        }),
                  ))
                ],
              );
            },
            error: (error, stack) => ErrorBody(error: error.toString()),
            loading: () => const Center(
                    child: CircularProgressIndicator(
                  color: Palette.primaryColor1,
                ))));
  }
}
