

import '../../models/Auth_model.dart';
import '../../models/booking_model.dart';

abstract class DoctorStates{}

class DoctorInitialState extends DoctorStates{}

class ChangeBottomNavState extends DoctorStates{}

class PostsLoadingState extends DoctorStates{}

class PostsSuccessState extends DoctorStates{}

class PostsErrorState extends DoctorStates{}

class LoadingUsrDataState extends DoctorStates{}

class SuccessUsrDataState extends DoctorStates
{
  LoginModel loginModel;
  SuccessUsrDataState(this.loginModel);
}

class ErrorUsrDataState extends DoctorStates {}

class LoadingUpdateUserState extends DoctorStates {}

class SuccessUpdateUserState extends DoctorStates
{
  LoginModel loginModel;
  SuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends DoctorStates {}

class ScadulesLoadingState extends DoctorStates{}

class ScadulesSuccessState extends DoctorStates{}

class ScadulesErrorState extends DoctorStates{}

class AddBookingLoadingState extends DoctorStates{}

class AddBookingSuccessState extends DoctorStates{}

class AddBookingErrorState extends DoctorStates{}

class HaveBookingLoadingState extends DoctorStates{}

class HaveBookingSuccessState extends DoctorStates{}

class HaveBookingErrorState extends DoctorStates{}

class DeleteBookingLoadingState extends DoctorStates{}

class DeleteBookingSuccessState extends DoctorStates{}

class DeleteBookingErrorState extends DoctorStates{
  final String error;

  DeleteBookingErrorState({required this.error});
}

class ChangeBookingState extends DoctorStates
{
  BookingModel? model;

  ChangeBookingState (this.model);
}



