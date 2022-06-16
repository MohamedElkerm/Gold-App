import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_price/cubit/status/status.dart';

import '../../network/dio/dio.dart';

class MainCubit extends Cubit<Status>{
  MainCubit() : super(InitState());


  static MainCubit get(context)=> BlocProvider.of(context);



  double? goldD;
  int?   goldI;

  double? silverD;
  int?   silverI;
  getGoldPrice(){
    DioHelper.getData('XAU/USD/').then((value) {

      goldD =value.data['price'];
      goldI=goldD!.round();
      print(goldI);
      emit(GetGoldPriceState());

    }).catchError((error){
      print(error.toString());
    });

  }
  getSilverPrice(){
    DioHelper.getData('XAG/USD/').then((value) {

      silverD =value.data['price'];
      silverI=silverD!.round();
      print(silverI);
      emit(GetSilverPriceState());


    }).catchError((error){
      print(error.toString());
    });

  }

}