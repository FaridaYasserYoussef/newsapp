import 'package:newsapp/settings/model/data_sources/settings_data_sources.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsSharedPrefrencesDataSource extends SettingsDataSource{
  @override
  Future changeLocale(String locale) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);
    print('locale saved to shared prefs as ${prefs.getString('locale')}');

  }

  @override
  Future<String> getLocale() async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   String locale  = prefs.getString('locale')!;
   return locale;
  }

}
