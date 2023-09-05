import 'package:api_default_project/data/models/universal_data.dart';
import 'package:api_default_project/utils/get_dio_custom_error.dart';
import 'package:dio/dio.dart';

import '../models/defination/defination_model.dart';

class ApiService{


  final Dio dio = Dio();

  Future<UniversalData> postDefination({required String word})async{
    Response response = await dio.get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
    try{
      if(response.statusCode == 200){
        return UniversalData(data: DefinationModel.getFromList(response.data as List?));
      }
      return UniversalData(error: 'Other Error');
    } catch(e){
      return UniversalData(error: e.toString());
    }
  }

}