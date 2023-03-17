import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';
import 'AppStates.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  Color pickerColor = Color(0xff443a49);
  Color pickerColorS = Color(0xff443a49);
  bool appBarS=true;
  int counter=0;
  double contsize=120;
  bool background=true;
  MainAxisAlignment rowtt=MainAxisAlignment.start;
  MainAxisAlignment colt=MainAxisAlignment.start;
  int listcount=0;
  int listcount2=0;
  var text=TextEditingController();
  void changeColor(Color color)
  {
    pickerColor=color;
    emit(ColorChangeState());
  }
  void changeColorS(Color color)
  {
    pickerColorS=color;
    emit(ColorChangeState());
  }
  void emitState()
  {
    emit(GenericState());
  }
}