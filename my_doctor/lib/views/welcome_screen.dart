import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/controller/lang_cubit/cubit.dart';

import '../Components/general_component.dart';
import '../core/constants.dart';
import 'Register_screen.dart';




class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 420,
            decoration: const BoxDecoration(
              color: Color(0xffC4DFDF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120)),
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg',
                    ),
                    fit: BoxFit.cover),
                color: Color(0xff19A7CE),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 290,
              width: 340,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                   Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 20),
                    child: Text("My_Doctor".trx(context),
                      
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                   SizedBox(
                    width: 280,
                    child: Text(
                      "Instantly_you_can_easily_contact_with_the_doctor_and_contact_for_your_needs".trx(context),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // SizedBox(height: 80,),
                  // defaultButton(
                  //     width: 200,
                  //     function: () {
                  //       setState(() {
                  //         navigateTo(context,RegisterScreen());
                  //       });
                  //     },
                  //     text: 'Get Started'),
                  ///////
                    SizedBox(height: 10,),
                  BlocBuilder<LocaleCubit, ChangeLocaleState>(
                    builder: (context, state) {
                       return Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                           defaultButton(
                              width: 95,
                               function: () {
                                 BlocProvider.of<LocaleCubit>(context).changeLanguage('en');
                                },
                                text: 'english'),
                             SizedBox(width: 15,),
                             defaultButton(
                                 width: 90,
                                 function: () {
                                   BlocProvider.of<LocaleCubit>(context).changeLanguage('ar');
                                 },
                                 text: 'العربية'),

                           ],
                         ),
                       );
                       //  DropdownButton<String>(
                      //   value: state.locale.languageCode,
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //   items: ['Ar', 'En'].map((String items) {
                      //     return DropdownMenuItem<String>(
                      //       value: items,
                      //       child: Text(items),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String? newValue) {
                      //     if (newValue != null) {
                      //       BlocProvider.of<LocaleCubit>(context).changeLanguage(newValue);
                      //
                      //     }
                      //   },
                      // );
                    },
                  ),
                   SizedBox(height: 15,),
                   defaultButton(
                      width: 200,
                       function: () {
                        setState(() {
                          navigateTo(context,RegisterScreen());
                        });
                       },
                      text: 'Get_started'.trx(context)),
                

                  ////////
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
// bottomLeft:Radius.circular(100) ,
// bottomRight:Radius.circular(100)