import 'package:api_default_project/bloc/product/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const CupertinoActivityIndicator();
            }
            if (state is ProductSuccesState) {
              return ListView.builder(
                itemCount: state.product.length,
                itemBuilder: (context, index) {
                  final product = state.product[index];
                  return ListTile(
                    key: Key(product.name),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: product.image,fit: BoxFit.cover,width: 70,height: 70,
                          placeholder: (context, url) =>
                             const  CupertinoActivityIndicator(),
                          errorWidget: (context, error, url) =>
                              const Icon(CupertinoIcons.photo,size: 40,),
                        ),
                      ),
                    ),
                    title: Text(product.name,style: const TextStyle(color: Colors.black),),
                    subtitle: Text(product.id),
                    trailing: Text(product.yearBuilt.toString()),
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
