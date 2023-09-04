import 'dart:async';

import 'package:api_default_project/data/api/product_api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required ProductApiClient client}): _client = client ,super(ProductInitial()) {
    on<ProductFetch>(_fetchProduct);
  }


  final ProductApiClient _client;

  Future<void> _fetchProduct(
      ProductFetch event,
      Emitter<ProductState> emit,
      ) async {
    emit(ProductLoadingState());
    try {
      final products = await _client.getProduct();
      emit(ProductSuccesState(product: products));
    } catch (error) {
      emit(ProductErrorState());
    }
  }
}
