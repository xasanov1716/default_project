
import 'package:api_default_project/models/products/products_model.dart';

import '../../../models/universal_response.dart';
import '../api_provider.dart';

class ProductRepository {
  final ApiProvider apiProvider;

  ProductRepository({required this.apiProvider});

  Future<List<ProductModel>> fetchProducts() async {
    UniversalResponse universalResponse = await apiProvider.getProducts();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }


  Future<List<ProductModel>> deleteProducts(int id ) async {
    UniversalResponse universalResponse = await apiProvider.deleteProducts(id);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }



  Future<List<ProductModel>> sortProducts(String sort) async {
    UniversalResponse universalResponse = await apiProvider.sortProducts(sort);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }


  Future<List<ProductModel>> productById(int id) async {
    UniversalResponse universalResponse = await apiProvider.getProductsBuyId(id);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }


  Future<List<ProductModel>> productByLimit(int limit) async {
    UniversalResponse universalResponse = await apiProvider.getProductsBuyLimit(limit);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }

}