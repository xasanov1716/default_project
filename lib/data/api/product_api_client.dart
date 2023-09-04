import 'package:api_default_project/data/models/product/product_model.dart';
import 'package:api_default_project/data/queries/get_product.dart';
import 'package:graphql/client.dart';

class GetProductRequestFailure implements Exception {}

class ProductApiClient {
  const ProductApiClient({required this.graphQLClient});

  factory ProductApiClient.create() {
    final httpLink = HttpLink('https://spacex-production.up.railway.app/');
    final link = Link.from([httpLink]);

    return ProductApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient graphQLClient;

  Future<List<ProductModel>> getProduct() async {
    final result = await graphQLClient.query(
      QueryOptions(document: gql(getProductQuery)),
    );

    if (result.hasException) throw GetProductRequestFailure();
    return (result.data?['ships'] as List?)
            ?.map(
                (dynamic e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }
}
