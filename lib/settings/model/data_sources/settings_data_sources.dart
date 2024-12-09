
abstract class SettingsDataSource{
  Future<String> getLocale();
  Future changeLocale(String locale);
}