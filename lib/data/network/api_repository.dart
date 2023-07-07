
import '../../models/card_model.dart';
import '../../models/universal_response.dart';
import 'api_provider.dart';

class CardRepository {
  final ApiProvider apiProvider;

  CardRepository({required this.apiProvider});

  Future<List<BankModel>> fetchCard() async {
    UniversalResponse universalResponse = await apiProvider.getAllCard();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<BankModel>;
    }
    return [];
  }
}