import 'dart:convert';

import 'package:api_default_project/models/products/products_model.dart';
import 'package:http/http.dart' as http;

import '../../models/login/login_model.dart';
import '../../models/universal_response.dart';
import '../../models/user/user_model.dart';

class ApiProvider {
  Future<UniversalResponse> getProducts() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }


  Future<UniversalResponse> getProductsBuyLimit(String limit) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products?limit=$limit");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toString() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }


  Future<UniversalResponse> getProducBuyId(String id) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toString() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }


  Future<UniversalResponse> sortProducts(String sort) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products?sort=$sort");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toString() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> deleteProducts(String id) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      http.Response response = await http.delete(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toString() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }


  Future<UniversalResponse> getLogin() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/auth/login");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => LoginModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getAllUser() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/users");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => UserModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getAllCategories() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => UserModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }


  Future<UniversalResponse> getProductsByCategory(String  category) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/category/$category");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => UserModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }

}