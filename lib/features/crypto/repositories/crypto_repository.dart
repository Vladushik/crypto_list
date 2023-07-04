import 'package:crypto_list/features/crypto/models/crypto_model.dart';

abstract class CryptoRepository {
  Future<CryptoModel> getCryptoModel(String input);
}
