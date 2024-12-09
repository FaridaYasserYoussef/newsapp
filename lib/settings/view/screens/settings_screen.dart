import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/settings/view_model/settings_cubit.dart';
import 'package:newsapp/settings/view_model/settings_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        print("state when settings screen is built is ${state}");
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton<String>(

                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "English",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 'en',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "عربي",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 'ar',
                      ),
                    ],
                    onChanged: (value) async{
                      print("state before change is ${state}");
                      if (value != null) {
                       await context.read<SettingsCubit>().changeLocale(value);
                           final updatedState = context.read<SettingsCubit>().state;

                      print("state after change  is ${updatedState}");

                      }
                    },
                    value: state is SettingsArabicState? 'ar': 'en'
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
