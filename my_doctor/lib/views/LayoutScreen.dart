import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';

import '../Components/drwer_component.dart';
import '../controller/layout_cubit/cubit.dart';
import '../controller/layout_cubit/states.dart';
import '../core/constants.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          drawer: DrawerScreen(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: mainColor,
            title: Text(cubit.titles[cubit.currentIndex].trx(context)),
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white38,
              selectedItemColor: mainColor,
              unselectedItemColor: Colors.black54,
              onTap: ((index) {
                cubit.changeBottom(index);
              }),
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.trx(context)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.post_add), label: 'posts'.trx(context)),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notification'.trx(context)
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmarks_rounded), label: 'my_Booking'.trx(context)),
              ]),
        );
      },
    );
  }
}
