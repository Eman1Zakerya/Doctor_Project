import 'package:flutter/material.dart';
import 'package:my_doctor/core/constants.dart';
import 'package:my_doctor/models/Auth_model.dart';
import 'general_component.dart';


class DrawerScreen extends StatelessWidget {
   DrawerScreen({super.key});
  UserData? userData;

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          // UserAccountsDrawerHeader(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/images/HAWK prof.jpg"),
          //         fit: BoxFit.cover),
          //   ),
          //   accountEmail: null,
          //   accountName: null,
          // ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 170,
                decoration: const BoxDecoration(
                    color:mainColor,
                    borderRadius: BorderRadius.only(
                        bottomRight:Radius.circular(50),
                        bottomLeft:Radius.circular(50) )
                ),
              ),
              Positioned(
                bottom: -60,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 120,
                  height: 120,
                  decoration:  BoxDecoration(
                      image:const DecorationImage(
                          image:AssetImage('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg',),
                          fit: BoxFit.cover
                      ),
                      color: Color(0xff19A7CE),
                      borderRadius: BorderRadius.circular(20)



                  ),

                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
           ListTile(
              title: Text(
                "name : ${userData?.name} ",
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(
                Icons.person,color:mainColor ,
              ),
            ),
           ListTile(
              title: Text(
                "Age : ${userData?.age}",
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(Icons.view_agenda_outlined,color:mainColor ,),
             ),
           ListTile(
              title: Text(
                "gender :  ${userData?.gender}",
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(
                Icons.help_center,color:mainColor ,
              ),
             ),
           ListTile(
              title: Text(
                " Marital Status : ${userData?.maritalState}",
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(Icons.person,color:mainColor ,),
             ),
           ListTile(
              title: Text(
                " date of birth : ${userData?.brithdate}",
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(Icons.access_alarm_outlined,color:mainColor ,),
            ),

        ],
      ),
    );
  }
}