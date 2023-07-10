
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

  Future<List<ProductModel>> deleteProducts() async {
    UniversalResponse universalResponse = await apiProvider.deleteProducts();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }
}