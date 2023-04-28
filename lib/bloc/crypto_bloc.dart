import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/crypto_model.dart';
import '../service/api_service.dart';
part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  ApiService apiService = ApiService();

  CryptoBloc() : super(CryptoInitial()) {
    on<GetCryptoEvent>((event, emit) async{
      List<CryptoModel> data= await apiService.getCryptoData();
      emit(LoadingState());
      try{

        if(data.isNotEmpty){
          emit(UpdateState(data));
        }else{
          emit(ErrorState("No Data"));
        }
      }catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }
}
