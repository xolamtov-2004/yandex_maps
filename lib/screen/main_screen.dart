
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/bloc/nav/nav_bloc.dart';
import 'package:yandex_map/bloc/nav/nav_event.dart';
import 'package:yandex_map/screen/home_screen.dart';
import 'package:yandex_map/screen/order_screen.dart';
import 'package:yandex_map/screen/profile_screen.dart';
import 'package:yandex_map/screen/promo_screen.dart';
import 'package:yandex_map/widgets/app_bottom_nav.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBloc(),
      child: BlocBuilder<NavBloc, int>(
        builder: (context, index) {
          return Scaffold(
            body: IndexedStack(
              index: index,
              children: const [
                HomeScreen(),
                OrdersScreen(),
                PromoScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: AppBottomNav(
              currentIndex: index,
              onTap: (tab) => context.read<NavBloc>().add(NavTabChanged(tab)),
            ),
          );
        },
      ),
    );
  }
}