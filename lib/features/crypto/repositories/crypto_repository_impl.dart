import 'dart:io';

import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/features/crypto/models/crypto_model.dart';
import 'package:crypto_list/features/crypto/repositories/crypto_repository.dart';
import 'package:dio/dio.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  @override
  Future<CryptoModel> getCryptoModel(String input) async {
    String url =
        'https://api.n.exchange/en/api/v1/orders/${input.toUpperCase()}/';
    //String url = 'https://api.n.exchange/en/api/v1/orders/OSDIFE/';
    final Dio dio = Dio();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        CryptoModel data = CryptoModel.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to load');
      }
    } on DioException catch (e) {
      throw Failure('${e.response?.statusMessage}');
    } on SocketException {
      throw const Failure('No internet connection');
    } catch (e) {
      throw const Failure('Something went wrong');
    }
  }
}
