
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yandex_map/core/app_text.dart';


import '../bloc/search/search_bloc.dart' show SearchBloc;
import '../bloc/search/search_event.dart';
import '../bloc/search/search_state.dart';
import '../core/app_colors.dart';
import '../model/Place.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/nearby_banner.dart';
import '../widgets/place_tile.dart';
import '../widgets/searchInput.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/search_tabs.dart';
import 'fare_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  void _openFare(BuildContext context, Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FareScreen(destination: place)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SearchAppBar(),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) Navigator.pop(context);
        },
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          final places = state.places;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: SearchInput(
                  onChanged: (value) => bloc.add(SearchQueryChanged(value)),
                ),
              ),
              SearchTabs(
                index: state!.tabIndex,
                onChanged: (index) => bloc.add(SearchTabChanged(index)),
              ),
              Expanded(
                child: places.isEmpty
                    ? Center(
                  child: Text(
                    'Hech narsa topilmadi',
                    style:
                    inter(13, FontWeight.w400, AppPalette.textGrey),
                  ),
                )
                    : ListView.separated(
                  itemCount: places.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    color: AppPalette.border,
                  ),
                  itemBuilder: (context, index) => PlaceTile(
                    place: places[index],
                    onTap: () => _openFare(context, places[index]),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: NearbyBanner(
                  text: "Toshkent | 5 daqiqa | Atrofda 14 ta bo'sh",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}