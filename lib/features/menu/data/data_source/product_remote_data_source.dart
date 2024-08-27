import 'dart:convert';

import 'package:grocery/features/menu/data/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getMenuItems();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getMenuItems() async {
    try {
      final response = await client.get(
        Uri.parse(
          Urls.getAllProducts(),
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> productData = jsonResponse['data'];
        final List<ProductModel> products =
            productData.map((json) => ProductModel.fromJson(json)).toList();

        return products;
      } else {
        throw ServerException();
      }
    } on CacheException {
      throw CacheException();
    } catch (e) {
      throw ServerException();
    }
  }
}
