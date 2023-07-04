import 'package:crypto_list/features/crypto/bloc/crypto_bloc.dart';
import 'package:crypto_list/features/crypto/repositories/crypto_repository.dart';
import 'package:crypto_list/features/crypto/repositories/crypto_repository_impl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => CryptoBloc(repository: sl()));

  sl.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(),
  );
}
