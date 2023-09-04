part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class ProductLoadingState extends ProductState {}


class ProductSuccesState extends ProductState {


  ProductSuccesState({required this.product});

final List<ProductModel> product;
}



class ProductErrorState extends ProductState {}