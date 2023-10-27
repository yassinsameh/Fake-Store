import 'package:fake_store/products_feature/models/product.dart';
import 'package:fake_store/products_feature/models/rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final storageServiceProvider = Provider((ref) => StorageService());

final storageInitializationFuture = FutureProvider((ref) async {
  final storageService = ref.watch(storageServiceProvider);
  await storageService.init();
});

class StorageService {
  static const cartBox = 'cart';
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductImplAdapter());
    Hive.registerAdapter(RatingImplAdapter());
    await Hive.openBox(cartBox);
  }

  Future<void> updateCart(
      {required int productId,
      required int quantity,
      required bool adding}) async {
    try {
      final box = Hive.box(cartBox);
      final previousValue = box.get(productId) ?? 0;

      if (previousValue == 0 && !adding) {
        return;
      }
      final finalCount =
          adding ? previousValue + quantity : previousValue - quantity;
      if (finalCount <= 0) {
        await box.delete(productId);
        return;
      }
      await box.put(productId, finalCount);
    } catch (e) {
      throw ("Sorry, something went wrong");
    }
  }
}

// final cartStreamProvider = StreamProvider((ref) async* {
//   final usersBox = Hive.box(StorageService.cartBox).listenable();
//   final results = usersBox.values;
//   yield* Stream.value(usersBox);
// });
