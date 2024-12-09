import 'package:newsapp/common/services_locator.dart';
import 'package:newsapp/settings/repository/settings.repository.dart';

abstract class SettingsState{}

class SettingsLoadingState extends SettingsState{}

class SettingsInitialState extends SettingsState{
 
}
class SettingsArabicState extends SettingsState{}
class SettingsEnglishState extends SettingsState{}

class SettingsSuccessState extends SettingsState{
  final String locale;

  SettingsSuccessState({required this.locale});
}

class SettingsErrorState extends SettingsState{
  final String errorMessage;

  SettingsErrorState({required this.errorMessage});
}
