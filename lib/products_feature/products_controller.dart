import 'package:fake_store/products_feature/products_datasource.dart';
import 'package:fake_store/products_feature/products_service.dart';
import 'package:fake_store/products_feature/products_state.dart';
import 'package:fake_store/storage/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/product.dart';

final productsControllerProvider =
    StateNotifierProvider<ProductsController, ProductsState>((ref) {
  final productsService = ref.watch(productsServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return ProductsController(
      const ProductsState(), productsService, storageService);
  // return ProductsController(const ProductsState());
});

class ProductsController extends StateNotifier<ProductsState> {
  final ProductsService _productsService;
  final StorageService _storageService;
  ProductsController(
    ProductsState state,
    this._productsService,
    this._storageService,
  ) : super(state);

  Future<void> fetchProducts() async {
    state = state.copyWith(
      products: const AsyncValue.loading(),
    );

    try {
      final products = await _productsService.fetchProducts();
      state = state.copyWith(
        products: AsyncValue.data(products),
      );
    } catch (e, stack) {
      if (kDebugMode) {
        print("Fetching products error: $e");
      }
      state = state.copyWith(products: AsyncValue.error(e, stack));
    }
  }

  void updateTempProductSelection(
      {required int selectedProduct,
      required int quantity,
      required bool adding}) {
    Map<int, int> currentSelection = {...state.tempProductSelection};
    final previousValue = currentSelection[selectedProduct] ?? 0;
    if (previousValue == 0 && !adding) {
      return;
    }
    int finalCount =
        adding ? previousValue + quantity : previousValue - quantity;
    if (finalCount <= 0) {
      currentSelection.remove(selectedProduct);
    } else {
      currentSelection[selectedProduct] = finalCount;
    }

    state = state.copyWith(tempProductSelection: currentSelection);
  }

  Future<void> updateCartFromTemp() async {
    try {
      state.tempProductSelection.forEach((key, value) async {
        await _storageService.updateCart(
            productId: key, quantity: value, adding: true);
      });
      state = state.copyWith(tempProductSelection: {});
    } catch (e) {
      throw ("Something went wrong");
    }
  }

  Future<void> updateCart(
      {required int selectedProduct,
      required int quantity,
      required bool adding}) async {
    try {
      await _storageService.updateCart(
          productId: selectedProduct, quantity: quantity, adding: adding);
    } catch (e) {
      throw ("Something went wrong");
    }
  }

  Stream<Iterable<Set<int>>> cartStream() {
    final cartBox = Hive.box(StorageService.cartBox);
    print("Box values: ${cartBox.values}");
    print("Box keys: ${cartBox.keys}");
    return cartBox.watch().map(
          (boxEvent) => (cartBox.keys.map((key) => {key, cartBox.get(key)})),
        );
  }

  ValueListenable<Box> cartListenable() {
    final box = Hive.box(StorageService.cartBox);
    return box.listenable();
  }
}

final cartBoxProvider = Provider<Box>((ref) {
  // Initialize Hive and open your box
  final box = Hive.box(StorageService.cartBox);
  return box;
});

final cartStreamProvider = StreamProvider.autoDispose((ref) {
  final cartBox = ref.watch(cartBoxProvider);
  return cartBox.watch();
});

///Listens to events from the Box and refreshes accordingly
final cartFutureProvider =
    FutureProvider.autoDispose<Map<int, int>>((ref) async {
  final cartBox = ref.watch(cartBoxProvider);
  final _ = ref.watch(cartStreamProvider);
  Map<int, int> cart = {};
  cartBox.toMap().forEach((key, value) {
    cart[key] = value;
  });
  return cart;
});

// final cartStreamProvider = StreamProvider((ref) {
//   final cartBox = Hive.box(StorageService.cartBox);
//
//   return cartBox.watch().map(
//         (boxEvent) => cartBox.toMap(), // Assuming that cartBox contains a Map.
//       );
// });
