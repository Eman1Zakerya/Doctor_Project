import 'package:flutter/material.dart';
import 'package:my_doctor/components/general_component.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/core/constants.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import 'have _booking_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body:SingleChildScrollView(
        child: Column(
          children:  [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'),
                ),
              ),
            ),
            const Text('Dr. Ali',style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.video_call),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.chat),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.location_on_outlined),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.phone),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children:  [
                  Text('about'.trx(context),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ),
            const SizedBox(
              width: 340,
             child: Text('Lorem ipsum is placeholder text commonly used in the graphic, '
                 'print, and publishing industries for previewing layouts and visual mockups.',
               style: TextStyle(
                 fontSize: 16,
               ),
             ),
            ),
            Padding(
              padding: const EdgeInsets.all( 20.0),
              child: Row(
                children: [
                  Text('Appointment_Date'.trx(context),
                    style: TextStyle(
                      color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ),
            /////////
            CalendarTimeline(
              showYears: true,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
              onDateSelected: (date){} ,//=> setState(() => _selectedDate = date)
              leftMargin: 20,
              monthColor: mainColor,
              dayColor: Colors.teal[200],
              dayNameColor: mainColor,
              activeDayColor: mainColor,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: mainColor,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
            Center(
              child: defaultButton(
                  width: 200,
                  function: (){
                    navigateTo(context, HaveBooking());
                  },
                  text: 'Book_Appointment'.trx(context)),
            ),
            SizedBox(
              height: 350,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index)=> const InformationItem(),
                  separatorBuilder:(context,index)=> const SizedBox(width: 15,),
                itemCount: 10,),
            )

          ],
        ),
      ) ,
    );
  }
  
}


