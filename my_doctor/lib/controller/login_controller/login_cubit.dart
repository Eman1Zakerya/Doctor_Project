import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/core/helper.dart';
import '../../models/Auth_model.dart';
import '../../network/remote/dio_helper.dart';
import '../../network/remote/endpoints.dart';
import 'login_states.dart';



class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit( ) : super(LoginInitialState());
  static LoginCubit get(context) =>BlocProvider.of(context);
  late LoginModel loginModel;

  void userLogin({
    required String email,
    required String password
  })
  {
    emit(LoginLoadingState());
    Api().post(url: 'http://hawkltd-002-site14.atempurl.com/api/Account/Login',body: {
      'email':email,
      'password':password,
    }).then((value)  {
      //print(value?.data);
      loginModel = LoginModel.fromJson(value?.data);

      emit(LoginSuccessState(loginModel));
    }).catchError((error){
     // print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(changePasswordVisibilityState());

  }





}