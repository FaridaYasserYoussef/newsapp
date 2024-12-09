import 'package:newsapp/settings/model/data_sources/settings_data_sources.dart';

class SettingsRepository{
  final SettingsDataSource dataSource;

  SettingsRepository({required this.dataSource});
  Future<String> getLocale() async{
    return await dataSource.getLocale();
  }
 Future changeLocale(String locale)async{
    await dataSource.changeLocale(locale);
  }
}