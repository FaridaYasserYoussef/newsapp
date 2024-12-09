import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/common/services_locator.dart';
import 'package:newsapp/settings/repository/settings.repository.dart';
import 'package:newsapp/settings/view_model/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState>{
  SettingsRepository settingsRepository;
  SettingsCubit():settingsRepository = SettingsRepository(dataSource: ServicesLocator.settingsDataSource), super(SettingsInitialState());
  
   getLocale() async{
    try{
        emit(SettingsLoadingState());
        String locale = await settingsRepository.getLocale();
      print("locale when getting is ${locale}");
if ( locale == 'en'){
          emit(SettingsEnglishState());
        }else if(locale == 'ar'){
          emit(SettingsArabicState());
        }    }
    catch(e){
      emit(SettingsErrorState(errorMessage: e.toString()));
    }
  }

 Future changeLocale(String locale) async{
    print("inside settings cubit change locale");
   try{
        emit(SettingsLoadingState());
        await settingsRepository.changeLocale(locale);
        if ( locale == 'en'){
          emit(SettingsEnglishState());
        }else if(locale == 'ar'){
          emit(SettingsArabicState());
        }
    }
    catch(e){
      emit(SettingsErrorState(errorMessage: e.toString()));
    }  }
}