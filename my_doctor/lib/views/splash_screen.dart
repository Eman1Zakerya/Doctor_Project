import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/splash_View.dart';
import '../controller/splash_controller/cubit.dart';
import 'LayoutScreen.dart';



//
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: splash ,
//       body: BlocProvider(
//         create: (context) => SplashCubit()..loadData(),
//         child: BlocListener<SplashCubit, SplashState>(
//             listener: (context, state) {
//               // Listen to state changes and navigate to the appropriate screen
//               if (state == SplashState.loaded) {
//                 // Replace `HomeScreen` with your desired screen after the splash screen
//                 //Navigator.pushReplacementNamed(context, LayoutScreen() as String);
//                 SplashCubit.get(context).navigateAndFinish(context, LayoutScreen());
//               }
//             },
//             child: SplashViewBody()
//
//         ),
//       ),
//     );
//   }
// }