import 'package:calculator/model/money_model.dart';
import 'package:dio/dio.dart';

class MoneyApi {
  static const String _url = "https://api.genelpara.com/embed/para-birimleri.json";

  static Future<List<ExcangeRate>> getExchangeModel() async {
    List<ExcangeRate> _list = [];
    try {
      final response = await Dio().get(_url);
      if (response.statusCode == 200) {
        final exchangeList = response.data;
        if (exchangeList is List) {
          _list = exchangeList.map((e) => ExcangeRate.fromJson(e)).toList();
        }
      }
      return _list;
    } catch (e) {
      // Hata durumunda burada hata yönetimini gerçekleştirin
      print("Hata oluştu: $e");
      return [];
    }
  }
}
