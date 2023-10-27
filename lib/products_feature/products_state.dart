import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models/product.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(AsyncValue.loading()) AsyncValue<List<Product>> products,
    @Default(AsyncValue.loading()) AsyncValue<Map<int, Product>> cart,
    @Default({}) Map<int, int> tempProductSelection,
  }) = _ProductsState;
}
