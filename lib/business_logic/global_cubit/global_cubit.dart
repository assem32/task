import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

   LoginModel ? loginModel;
   LoginModel ?registerModel;
  int index=0;
  void changeLogin(){
    index=0;
    emit(ChangeToRegister());
  }
  void changeRegister(){
    index=1;
    emit(ChangeToRegister());
  }

  void userLogin(email,password){
    DioHelper.postData(url: Login, body: {
      'email':email,
      'password':password
    }).then((value) {
      loginModel=LoginModel.formJson(value.data);
      print(loginModel?.account);
      emit(LoginSuccess(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginError(error.toString()));
    });
  }

  void userRegister(name,email,password,phone,){
    DioHelper.postData(url: Register, body: {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone

    }).then((value) {
      loginModel=LoginModel.formJson(value.data);
      print(loginModel?.account);
      emit(RegisterSuccess(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterError());
    });
  }

}
