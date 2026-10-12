import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_map/bloc/splash/splash_bloc.dart';
import 'package:yandex_map/bloc/splash/splash_event.dart';
import 'package:yandex_map/bloc/splash/splash_state.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/screen/onboading_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplashEvent()),
      child: Scaffold(
        backgroundColor: AppColors.splash_colors,
        body: SafeArea(
          child: BlocConsumer<SplashBloc, SplashState>(
            listenWhen:(previus, current) => !previus.isCompleted && current.isCompleted,
            listener: (BuildContext context, SplashState state) {

              if (state.isCompleted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnboardingScreen()),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Logo Container.png'),
                    const SizedBox(height: 20),
                    Text(
                      "YangiGO",
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Hududiy Haydovchi Platformasi",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // BLoC yordamida avtomatik aylanuvchi indicator
                    Row(
                      mainAxisAlignment: .center,
                      children: List.generate(
                        4,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: state.activeIndex == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: state.activeIndex == index
                                ? AppColors.pageview_indicator
                                : Colors.white30,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
