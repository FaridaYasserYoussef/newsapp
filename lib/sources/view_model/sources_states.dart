import 'package:newsapp/sources/model/data_models/source.dart';

abstract class SourcesState {}

class SourcesInitialState extends SourcesState {}

class SourcesLoadingState extends SourcesState {}

class SourcesSuccessState extends SourcesState {
  List<Source> sourcesList;
  SourcesSuccessState({required this.sourcesList});
}

class SourcesErrorState extends SourcesState {
  String errorMessage;
  SourcesErrorState({required this.errorMessage});
}
