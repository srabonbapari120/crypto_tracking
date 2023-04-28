part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
}

class CryptoInitial extends CryptoState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CryptoState {
  @override
  List<Object> get props => [];
}

class UpdateState extends CryptoState {
  List<CryptoModel> data;
  UpdateState(this.data);
  @override
  List<Object> get props => [data];
}

class ErrorState extends CryptoState {
  String message;
  ErrorState(this.message);
  @override
  List<Object> get props => [message];
}
