import 'package:fake_store/component_widgets/product_tile.dart';
import 'package:fake_store/core/error_screen.dart';
import 'package:fake_store/core/theme.dart';
import 'package:fake_store/products_feature/product_details.dart';
import 'package:fake_store/products_feature/products_controller.dart';
import 'package:fake_store/products_feature/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../core/palette.dart';
import '../core/scaffold.dart';

class AllProducts extends ConsumerStatefulWidget {
  static const name = "all-products";
  const AllProducts({super.key});

  @override
  AllProductsState createState() => AllProductsState();
}

class AllProductsState extends ConsumerState<AllProducts> {
  bool updatingCart = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GeneralScaffold(
        floatingActionButton: ref
                .watch(productsControllerProvider)
                .tempProductSelection
                .isEmpty
            ? null
            : ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.primaryColor1)),
                onPressed: () async {
                  try {
                    if (updatingCart) return;
                    setState(() {
                      updatingCart = true;
                    });
                    await ref
                        .read(productsControllerProvider.notifier)
                        .updateCartFromTemp();
                    ref.read(globalNavbarController).jumpToTab(1);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  } finally {
                    if (mounted) {
                      setState(() {
                        updatingCart = false;
                      });
                    }
                  }
                },
                child: Text("Update Cart",
                    style: AppTheme.textThemes.titleLarge
                        ?.copyWith(color: Palette.whiteText)),
              ),
        body: ref.watch(productsControllerProvider).products.when(
            data: (products) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 2),
                      child: ListView.separated(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductTile(
                            onTap: () {
                              context.pushNamed(ProductDetails.name,
                                  extra: product);
                            },
                            isLoading: updatingCart,
                            product: product,
                            quantitySelected: ref
                                    .watch(productsControllerProvider)
                                    .tempProductSelection[product.id] ??
                                0,
                            onPressedAddition: () {
                              ref
                                  .read(productsControllerProvider.notifier)
                                  .updateTempProductSelection(
                                    selectedProduct: product.id,
                                    quantity: 1,
                                    adding: true,
                                  );
                            },
                            onPressedSubtraction: () {
                              ref
                                  .read(productsControllerProvider.notifier)
                                  .updateTempProductSelection(
                                    selectedProduct: product.id,
                                    quantity: 1,
                                    adding: false,
                                  );
                            },
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error, stack) => ErrorBody(
                  error: error.toString(),
                  retry: () => ref
                      .read(productsControllerProvider.notifier)
                      .fetchProducts(),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Palette.primaryColor1,
                  ),
                )));
  }
}
