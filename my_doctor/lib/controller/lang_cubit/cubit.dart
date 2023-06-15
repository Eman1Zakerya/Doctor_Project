import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/config/local/lang_cash_helper.dart';

part 'states.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState( locale:const Locale('en') ,));//

   Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
  // Future<void> changeLanguage2(String languageCode) async {
  //   await LanguageCacheHelper().cacheLanguageCode(languageCode);
  //   emit(ChangeLocaleState(locale: Locale(languageCode)));
  // }
}