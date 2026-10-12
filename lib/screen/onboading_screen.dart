


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import '../bloc/onSplash/on_splash_page_changed_bloc.dart';
import '../bloc/onSplash/on_splash_page_changed_event.dart';
import '../bloc/onSplash/on_splash_page_changed_state.dart';
import '../model/splash_screen_item.dart';
import 'login_screen.dart';

const _orange = Color(0xFFFF6B00);
const _orangeLight = Color(0xFFFFD9BF);
const _orangeShadow = Color(0x59FF6B00);
const _textDark = Color(0xFF111827);
const _textGrey = Color(0xFF9CA3AF);

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onStateChanged(BuildContext context, OnboardingState state) {
    if (state.isCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      return;
    }
    // Bloc sahifani o'zgartirdi (tugma bosildi): PageView'ni o'sha yerga suramiz.
    if (_controller.hasClients &&
        _controller.page?.round() != state.currentPage) {
      _controller.animateToPage(
        state.currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: _onStateChanged,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: _SkipButton(
                    onPressed: () => bloc.add(OnboardingSkipPressed()),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingItems.length,
                    onPageChanged: (index) =>
                        bloc.add(OnboardingPageChanged(index)),
                    itemBuilder: (context, index) =>
                        _OnboardingPage(item: onboardingItems[index]),
                  ),
                ),
                BlocBuilder<OnboardingBloc, OnboardingState>(
                  buildWhen: (previous, current) =>
                  previous.currentPage != current.currentPage,
                  builder: (context, state) {
                    return Column(
                      children: [
                        _Indicator(
                          count: state.pageCount,
                          activeIndex: state.currentPage,
                        ),
                        const SizedBox(height: 24),
                        _NextButton(
                          label: state.isLastPage
                              ? 'Boshlash'
                              : 'Davom etish →',
                          onPressed: () => bloc.add(OnboardingNextPressed()),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const _OnboardingPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          AspectRatio(
            aspectRatio: 1.12,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: item.background,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(item.fallbackIcon, size: 72, color: _orange),
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22,
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              item.subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: _textGrey,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SkipButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFF3F4F6),
        foregroundColor: _textGrey,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        "O'tkazib yuborish",
        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final int count;
  final int activeIndex;

  const _Indicator({required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 6,
          width: isActive ? 20 : 6,
          decoration: BoxDecoration(
            color: isActive ? _orange : _orangeLight,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

class _NextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _NextButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: _orangeShadow,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: _orange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}