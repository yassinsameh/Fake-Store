import 'package:fake_store/products_feature/products_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/failure.dart';
import 'models/product.dart';

final productsServiceProvider = Provider<ProductsService>((ref) {
  final productsDatasource = ref.watch(productsDatasourceProvider);
  return ProductsService(productsDatasource);
});

class ProductsService {
  final ProductsDatasource _productsDatasource;
  ProductsService(this._productsDatasource);

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _productsDatasource.fetchProducts();
      final data = response.data;
      final results = List<Map<String, dynamic>>.from(data);
      return results.map((e) => Product.fromJson(e)).toList();
    } on Failure catch (e) {
      throw e.message;
    } catch (e, stack) {
      throw ("Something went wrong");
    }
  }
}
