abstract class SearchEvent{}

class SearchWordEvent extends SearchEvent{
  final String word;

  SearchWordEvent({required this.word});
}