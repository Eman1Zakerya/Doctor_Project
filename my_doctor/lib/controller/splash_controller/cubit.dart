import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Create an enum to represent the possible states of the splash screen
enum SplashState { initial, loaded }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial);
  static SplashCubit get(context) =>BlocProvider.of(context);

  void loadData() {
    // Simulate an asynchronous task, such as fetching data from an API
    // You can replace this with your own implementation
    Future.delayed(const Duration(seconds: 20), () {
      // Transition to the loaded state once the task is completed
      emit(SplashState.loaded);
    });
  }
  void navigateAndFinish( BuildContext context, Widget widget)=>Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=>widget),
          ( Route <dynamic>route) => false
  );
}