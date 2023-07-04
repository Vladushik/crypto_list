part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
}

class CryptoInitialState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadingState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadedState extends CryptoState {
  final CryptoModel cryptoModel;

  const CryptoLoadedState({
    required this.cryptoModel,
  });

  @override
  List<Object> get props => [cryptoModel];
}

class CryptoErrorState extends CryptoState {
  final Object? exception;

  const CryptoErrorState({required this.exception});

  @override
  List<Object> get props => [];
}
