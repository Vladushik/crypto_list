import 'package:crypto_list/features/crypto/models/crypto_model.dart';
import 'package:crypto_list/features/crypto/repositories/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository repository;
  CryptoBloc({required this.repository}) : super(CryptoInitialState()) {
    on<CryptoLoadEvent>(_cryptoLoad);
  }

  Future _cryptoLoad(CryptoLoadEvent event, Emitter<CryptoState> emit) async {
    emit(CryptoLoadingState());
    try {
      final CryptoModel cryptoModel =
          await repository.getCryptoModel(event.input);
      emit(CryptoLoadedState(cryptoModel: cryptoModel));
    } catch (e) {
      emit(CryptoErrorState(exception: e));
    }
  }
}
