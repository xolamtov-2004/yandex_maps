
abstract class SearchEvent {}

class SearchTabChanged extends SearchEvent {
  final int index;
  SearchTabChanged(this.index);
}

class SearchQueryChanged extends SearchEvent {
  final String query;
  SearchQueryChanged(this.query);
}