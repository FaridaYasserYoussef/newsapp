import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'homePage.dart';
import 'settings/view_model/settings_cubit.dart';
import 'settings/view_model/settings_states.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MyAppWithCubit();
  }
}

class MyAppWithCubit extends StatelessWidget {
  // const MyAppWithCubit({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return BlocProvider<SettingsCubit>(create: (context)=> SettingsCubit()..getLocale(),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            print("builder is trigerred");
            // String locale;
            // if (state is SettingsArabicState) {
            //   locale = 'ar';
              
            // }
            // if(state is SettingsEnglishState){
            //   locale = 'en';
            // }

             return MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(state is SettingsArabicState? 'ar': 'en'),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
          },
        
        ),
        
        );
      },
    );
  }
}
