import 'package:newsapp/common/services_locator.dart';
import 'package:newsapp/sources/model/data_models/source.dart';
import 'package:newsapp/sources/repository/sources_repository.dart';
import 'package:newsapp/sources/view_model/sources_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesRepository sourcesRepository;
  SourcesCubit()
      : sourcesRepository =
            SourcesRepository(dataSource: ServicesLocator.sourcesDataSource),
        super(SourcesInitialState());

  Future getSources(String catId) async {
    emit(SourcesLoadingState());
    try {
      List<Source> sourcesList = await sourcesRepository.getSources(catId);
      emit(SourcesSuccessState(sourcesList: sourcesList));
    } catch (e) {
      emit(SourcesErrorState(errorMessage: e.toString()));
    }
  }
}
