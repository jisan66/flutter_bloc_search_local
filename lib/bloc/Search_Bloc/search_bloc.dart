import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_search/bloc/Search_Bloc/search_event.dart';
import 'package:flutter_bloc_search/bloc/Search_Bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchLoadedState(loadedWords: apiWords)) {
    on<SearchWordEvent>((event, emit) {
      List<String> searchedWords =
          apiWords.where((element) => element.contains(event.word)).toList();
      emit(SearchLoadedState(loadedWords: searchedWords));
    });
  }

  static List<String> apiWords = [
    'jisan',
    'ankur',
    'priom',
    'goutom',
    'rasel',
    'jisco',
    'pritom'
  ];
}
