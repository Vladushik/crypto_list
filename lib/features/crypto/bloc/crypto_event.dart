part of 'crypto_bloc.dart';

abstract class CryptoEvent {}

class CryptoLoadEvent extends CryptoEvent {
  final String input;

  CryptoLoadEvent({required this.input});
}

class CryptoRefreshEvent extends CryptoEvent {}
