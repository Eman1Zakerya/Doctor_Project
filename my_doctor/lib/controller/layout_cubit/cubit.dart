
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/controller/layout_cubit/states.dart';
import '../../Views/posts_screen.dart';
import '../../core/constants.dart';
import '../../core/helper.dart';
import '../../models/Auth_model.dart';
import '../../models/Scedules_model.dart';
import '../../models/booking_model.dart';
import '../../models/posts_model.dart';
import '../../network/remote/dio_helper.dart';
import '../../network/remote/endpoints.dart';
import '../../views/Home_screen.dart';
import '../../views/booking_screen.dart';
import '../../views/notification_screen.dart';
import 'package:http/http.dart' as http;




class DoctorCubit extends Cubit<DoctorStates>
{
  DoctorCubit( ) : super(DoctorInitialState());
  static DoctorCubit get(context) =>BlocProvider.of(context);





  late int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const PostsScreen(),
    const NotificationScreen(),
     BookingScreen()
  ];
  List<String> titles =[
    'My_Doctor',
    'posts',
    'Notification',
    'my_Booking',
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }



  PostsModel? postsModel;
  List<PostsModel> postsList =[];

  Future<List<PostsModel>> getAllPosts() async
  {
    emit(PostsLoadingState());
    List<dynamic> data = await Api().get(url: 'http://hawkltd-002-site14.atempurl.com/api/Posts/Post/Posts', token: token);
    // print(('=====***************************************$data'));


    for(var i = 0; i<data.length;i++)
    {
      postsList.add(PostsModel.fromjson(data[i]));
    }
    print('=====***************************************${postsList[0].title}');
    emit(PostsSuccessState());
    // print((data));
    return postsList;

  }

  LoginModel? userModel;

  void getUserData() {
    // print(token);

    emit(LoadingUsrDataState());

    Api().get(url: 'http://hawkltd-002-site14.atempurl.com/api/Account/Myaccount', token: token).then((value) {
      userModel = LoginModel.fromJson(value!.data);
      print(userModel!.data!.name);

      emit(SuccessUsrDataState(userModel!));
    }).catchError((error) {
      //  print(error.toString());

      emit(ErrorUsrDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(LoadingUpdateUserState());

    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userModel = LoginModel.fromJson(value!.data);

      emit(SuccessUpdateUserState(userModel!));
    }).catchError((error) {
      //  print(error.toString());

      emit(ShopErrorUpdateUserState());
    });
  }

  ScadulesModel? scaduleModel;
  List<ScadulesModel> scadulesList =[];

  Future< List<ScadulesModel>>getScadules() async {
    emit(ScadulesLoadingState());
    List<dynamic> data= await Api().get(url: 'http://hawkltd-002-site14.atempurl.com/api/Scedules/Availabelscedules', token: token);
      for(var i = 0; i<data.length;i++)
      {
        scadulesList.add(ScadulesModel.fromjson(data[i]));
      }
      emit(ScadulesSuccessState());
      return scadulesList;

        }



  Map<int, bool> booking = {};

  BookingModel? bookingModel;

   void addBooking({
    required int id
   })async
  {
    booking[id] = !booking[id]!;
    emit(ChangeBookingState(bookingModel));
    emit(AddBookingLoadingState());
    Api().post(url: 'http://hawkltd-002-site14.atempurl.com/api/Visitas/CreateVisita?schedId',
        token: token,
        body: {
      'id':id,
    }).then((value)  {
      //print(value?.data);
      bookingModel = BookingModel.fromJson(value?.data);
      if (!bookingModel!.status!) {
        booking[id] = !booking[id]!;
      } else {
        getBooking();
      }

      emit(AddBookingSuccessState());
    }).catchError((error){
      booking[id] = !booking[id]!;
      // print(error.toString());
      emit(AddBookingErrorState());
    });

  }


  List<BookingModel> bookingList =[];

  Future< List<BookingModel>>getBooking() async {
    emit(HaveBookingLoadingState());
    List<dynamic> data= await Api().get(url: 'http://hawkltd-002-site14.atempurl.com/api/Visitas/Myvisitas', token: token);
    //=${bookingModel?.id}
    for(var i = 0; i<data.length;i++)
    {
      scadulesList.add(ScadulesModel.fromjson(data[i]));
    }
    emit(HaveBookingSuccessState());
    return bookingList;

  }
  //

  // void deletebooking({
  //
  //   required int id
  // }) async
  // {
  //
  // emit(DeleteBookingLoadingState());
  // Api().put(url: 'http://hawkltd-002-site14.atempurl.com/api/Visitas/Visitas/CancelVisit/',token: token, body: {
  //   'id':id,
  //
  // }).then((value)  {
  //   //print(value?.data);
  //   bookingModel = BookingModel.fromJson(value?.data);
  //   emit(DeleteBookingSuccessState());
  // }).catchError((error){
  //   // print(error.toString());
  //  // emit(DeleteBookingErrorState(error: e.toString()));
  // });
  //
  // }

  Future<void> deletebooking({required int id} ) async {
    try {
      emit(DeleteBookingLoadingState());

      // Make the API request
      final response = await http.delete(
        Uri.parse('http://hawkltd-002-site14.atempurl.com/api/Visitas/Visitas/CancelVisit/$id'),
      );

      if (response.statusCode == 200) {
        emit(DeleteBookingSuccessState());
      } else {
        emit(DeleteBookingErrorState(error: 'Failed to delete data'));
      }
    } catch (e) {
      emit(DeleteBookingErrorState(error: e.toString()));
    }
  }



  // void addBooking({required int id}) {
  //   booking[id] = !booking[id]!;
  //   emit(ChangeBookingState(bookingModel));
  //   DioHelper.postData(
  //       url: VISITES,
  //       data: {
  //         'id': id,
  //       },
  //       token: token)
  //       .then((value) {
  //     bookingModel = bookingModel?.fromJson(value!.data);
  //
  //     if (!bookingModel!.status!) {
  //       booking[id] = !booking[id]!;
  //     } else {
  //       getBooking();
  //     }
  //
  //     emit(AddBookingSuccessState());
  //   }).catchError((error) {
  //     booking[id] = !booking[id]!;
  //     emit(AddBookingErrorState());
  //   });
  // }

}



  // File? profileImage;
  // var picker = ImagePicker();
  //
  // Future<void> getProfileImage()async{
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if(pickedFile !=null)
  //   {
  //     profileImage = File(pickedFile.path);
  //     emit(SocialProfileImagePickedSuccessState());
  //   }else
  //   {
  //     print('No image selected');
  //     emit(SocialProfileImagePickedErrorState());
  //   }
  // }

