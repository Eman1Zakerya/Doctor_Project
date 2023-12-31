import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/controller/register_cubit/states.dart';
import '../../core/helper.dart';
import '../../models/Auth_model.dart';
import '../../network/remote/dio_helper.dart';
import '../../network/remote/endpoints.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit( ) : super(RegisterInitialState());
  static RegisterCubit get(context) =>BlocProvider.of(context);
  late LoginModel loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String maritalState,
    required String brithdate,
    required String age,
  })
  {
    emit(RegisterLoadingState());
    Api().post(url: 'http://hawkltd-002-site14.atempurl.com/api/Account/Register', body: {
      'name' : name,
      'email':email,
      'password':password,
      'phone' : phone,
      'gender' : gender,
      'maritalState':maritalState,
      'brithdate':brithdate,
      'age' : age,
    }).then((value)  {
      print(value?.data);
      loginModel = LoginModel.fromJson(value?.data);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibilityState());

  }





}