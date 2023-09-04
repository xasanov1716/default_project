import 'package:api_default_project/bloc/product/product_bloc.dart';
import 'package:api_default_project/data/api/product_api_client.dart';
import 'package:api_default_project/ui/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp(client: ProductApiClient.create()));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final ProductApiClient client;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc(
            client: client,
          )..add(ProductFetch()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductScreen(),
      ),
    );
  }
}