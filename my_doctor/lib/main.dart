import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/views/Register_screen.dart';
import 'package:my_doctor/views/booking_screen.dart';
import 'package:my_doctor/views/welcome_screen.dart';
import 'Views/posts_screen.dart';
import 'bloc_observer.dart';
import 'config/local/app_localisations.dart';
import 'controller/lang_cubit/cubit.dart';
import 'controller/layout_cubit/cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/constants.dart';
import 'network/local/cash_helper.dart';
import 'network/remote/dio_helper.dart';






void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await  CashHelper.init();
  token = CashHelper.getData(key: 'token');
  runApp(
     const MyApp(),
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(create: (context) => LocaleCubit()..getSavedLanguage(),),
          //BlocProvider<SplashCubit>(create:(BuildContext context)=>SplashCubit()..loadData()),
          BlocProvider<DoctorCubit>(create:(BuildContext context)=>DoctorCubit()..getAllPosts()..getScadules()..getBooking()),
        ],
        child: BlocBuilder<LocaleCubit, ChangeLocaleState>
        (
        builder: (context, state) {
          return MaterialApp(
           locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            home:WelcomeScreen(),//WelcomeScreen(),
          );
        },
      ),
        );
  }
}
// 

