abstract class SearchState {}

class SearchInitialState extends SearchState{}

class SearchLoadingState extends SearchState{}

class SearchLoadedState extends SearchState{
  List<String> loadedWords;

  SearchLoadedState({required this.loadedWords});
}