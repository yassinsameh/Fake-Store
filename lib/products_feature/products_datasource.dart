import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api.dart';
import '../core/endpoints.dart';
import '../core/failure.dart';

final productsDatasourceProvider = Provider((ref) {
  final api = ref.watch(apiProvider);
  return ProductsDatasource(api: api);
});

abstract class AbstractProductsDatasource {
  Future<Response> fetchProducts();
}

class ProductsDatasource {
  final Dio api;

  ProductsDatasource({required this.api});

  Future<Response> fetchProducts() async {
    try {
      final response = await api.get('${Endpoints.baseUrl}/products');
      return response;
    } on DioException catch (e) {
      ///Just one example of error handling
      if (e is SocketException) {
        throw const Failure(message: "No Internet Connection", code: 502);
      }
      throw Failure(
          message: "${e.message}", code: e.response?.statusCode ?? 500);
    }
  }
}
