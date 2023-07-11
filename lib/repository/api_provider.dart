import 'package:dio/dio.dart';
import 'package:pray_time/models/pray_time_model.dart';

class ApiProvider {
  Dio dio = Dio();
  Future<PrayTimeModel?> getTimes() async {
    String url = 'https://islomapi.uz/api/present/day?region=Toshkent';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return PrayTimeModel.fromJson(response.data);
    }
  }
}
