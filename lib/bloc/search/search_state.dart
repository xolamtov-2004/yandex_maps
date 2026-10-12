
import '../../model/Place.dart';

class SearchState {
  final int tabIndex; // 0 = Yaqinda, 1 = Sevimlilar
  final String query;

  const SearchState({this.tabIndex = 0, this.query = ''});

  /// Tanlangan tab va qidiruv matniga mos joylar.
  List<Place> get places {
    final source = tabIndex == 0 ? recentPlaces : favoritePlaces;
    final text = query.trim().toLowerCase();
    if (text.isEmpty) return source;
    return source
        .where((place) =>
    place.title.toLowerCase().contains(text) ||
        place.subtitle.toLowerCase().contains(text))
        .toList();
  }

  SearchState copyWith({int? tabIndex, String? query}) {
    return SearchState(
      tabIndex: tabIndex ?? this.tabIndex,
      query: query ?? this.query,
    );
  }
}