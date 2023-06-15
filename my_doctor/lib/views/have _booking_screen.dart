import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/core/constants.dart';
import 'package:my_doctor/models/Scedules_model.dart';
import '../Components/general_component.dart';
import '../controller/layout_cubit/cubit.dart';
import '../controller/layout_cubit/states.dart';


class HaveBooking extends StatelessWidget {
   HaveBooking({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        return ConditionalBuilder(
          condition: DoctorCubit.get(context).scadulesList.isNotEmpty,
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
                  var scadulesModel = DoctorCubit.get(context).scadulesList;
                  return Scadual_Item(scaduleModel: scadulesModel, index: index,);
                },
                separatorBuilder: (context, index) =>const SizedBox(height: 8,),
                itemCount: DoctorCubit.get(context).scadulesList.length
            ) ,
          ), fallback:(context)=>Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.menu,size: 100,color: Colors.grey,),
            Text('No_available_dates_yet'.trx(context),
              style: const TextStyle(
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








class Scadual_Item extends StatelessWidget {
   Scadual_Item({
    super.key,
    required this.scaduleModel,required this.index
  });

   final List<ScadulesModel> scaduleModel;
   final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: SizedBox(
        width: double.infinity,
        height: 360,
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
                           Text('${scaduleModel[index].dayName}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),),
                          const SizedBox(height: 5,),
                          Text('${scaduleModel[index].dateOnly}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),),
                          const SizedBox(height: 5,),
                           Text('start: ${scaduleModel[index].startTime}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),),
                          const SizedBox(height: 5,),
                          Text('end: ${scaduleModel[index].endTime}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),),
                          const SizedBox(height: 5,),
                          Text('Availability: ${scaduleModel[index].availability}',
                            style: const TextStyle(
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
                          DoctorCubit.get(context).addBooking(id: scaduleModel[index].id!);
                        },
                        text: 'chose'.trx(context)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}