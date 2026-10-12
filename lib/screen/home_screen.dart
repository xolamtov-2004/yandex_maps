import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/screen/search_screen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../bloc/home/home_bloc.dart';
import '../core/map_helpers.dart';
import '../model/Place.dart';
import '../widgets/app_map.dart';
import '../widgets/home/home_bottom_sheet.dart';
import '../widgets/home/home_top_bar.dart';
import '../widgets/home/map_controllers.dart';
import '../widgets/where_to_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  static const _zoomAnimation =
      MapAnimation(type: MapAnimationType.smooth, duration: 0.3);

  YandexMapController? _map;

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchScreen()),
    );
  }

  void _locate() {
    final map = _map;
    if (map == null) return;
    moveCameraTo(map, currentPlace.latitude, currentPlace.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppMap(
              mapObjects: [
                mapDot('me', currentPlace, const Color(0xFF3B82F6)),
              ],
              onMapCreated: (controller) {
                _map = controller;
                _locate();
              },
            ),
          ),
          Column(
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Column(
                    children: [
                      const HomeTopBar(),
                      const SizedBox(height: 12),
                      WhereToCard(onTap: _openSearch),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MapControls(
                    onZoomIn: () => _map?.moveCamera(
                      CameraUpdate.zoomIn(),
                      animation: _zoomAnimation,
                    ),
                    onZoomOut: () => _map?.moveCamera(
                      CameraUpdate.zoomOut(),
                      animation: _zoomAnimation,
                    ),
                    onLocate: _locate,
                  ),
                ),
              ),
              HomeBottomSheet(
                address: currentPlace.title,
                onChange: _openSearch,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
