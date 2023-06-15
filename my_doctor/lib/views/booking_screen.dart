import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/core/constants.dart';
import 'package:my_doctor/models/Scedules_model.dart';
import '../Components/general_component.dart';
import '../controller/layout_cubit/cubit.dart';
import '../controller/layout_cubit/states.dart';
import '../models/booking_model.dart';


class BookingScreen extends StatelessWidget {
  BookingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        return ConditionalBuilder(
          condition: DoctorCubit.get(context).bookingList.isNotEmpty,
          builder: ( context) =>Scaffold(
            backgroundColor:background ,
            appBar: AppBar(
              backgroundColor: mainColor,
              title: Text('have_a_booking_date'.trx(context)),
            ),
            body:ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var bookingModel = DoctorCubit.get(context).bookingList;
                  return Booking_Item(index: index, bookingModel: bookingModel,);
                },
                separatorBuilder: (context, index) =>const SizedBox(height: 8,),
                itemCount: DoctorCubit.get(context).bookingList.length
            ) ,
          ), fallback:(context)=>Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.menu,size: 100,color: Colors.grey,),
              Text('No_available_booking_yet'.trx(context),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),

        );
      },
    );
  }
}








class Booking_Item extends StatelessWidget {
  Booking_Item({
    super.key,
    required this.bookingModel,required this.index
  });

  final List<BookingModel> bookingModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0,top: 20,bottom: 10),
              child: Row(
                children:  [
                  const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg')
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('doctor Alia ',
                        style:TextStyle(
                            color: mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ) ,),
                      SizedBox(height: 5,),
                      Text('surgery major',
                        style:TextStyle(
                            color:Colors.black,
                            fontSize: 16
                        ) ,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: background,
              child: Row(

                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text('booking_date'.trx(context),
                          style:
                          TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18
                          ),),
                        const SizedBox(height: 7,),
                        Text('${bookingModel[index].scedules?.dayName}:${bookingModel[index].scedules?.dateOnly}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15
                          ),),
                        SizedBox(height: 5,),
                        Text('stare${bookingModel[index].scedules?.startTime}:end${bookingModel[index].scedules?.endTime}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15
                          ),),
                        SizedBox(height: 5,),
                        Text('Availability:${bookingModel[index].scedules?.availability}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15
                          ),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 80,),
                  const Icon(Icons.arrow_back_ios)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: defaultButton(
                      width: 100,
                      function: (){
                        DoctorCubit.get(context).deletebooking(id: bookingModel[index].id!);
                      },
                      text: 'cancel'.trx(context)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}