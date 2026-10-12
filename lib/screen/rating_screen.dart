import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/bloc/ride/ride_bloc.dart';
import 'package:yandex_map/bloc/ride/ride_event.dart';
import 'package:yandex_map/bloc/ride/ride_state.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/Place.dart';
import 'package:yandex_map/model/driver.dart';
import 'package:yandex_map/model/tariff_dart.dart';
import 'package:yandex_map/screen/main_screen.dart';
import 'package:yandex_map/widgets/band_logo.dart';
import 'package:yandex_map/widgets/primary_button.dart';
import 'package:yandex_map/widgets/ride/driver_avatar.dart';
import '../widgets/ride/primarySummary.dart';
import '../widgets/ride/start_rating.dart';

class RatingScreen extends StatelessWidget {
  final Place destination;
  final Tariff tariff;
  final bool isCash;

  const RatingScreen({
    super.key,
    required this.destination,
    required this.tariff,
    required this.isCash,
  });

  @override
  Widget build(BuildContext context) {
    const driver = sampleDriver;
    final bloc = context.read<RideBloc>();

    return BlocListener<RideBloc, RideState>(
      listener: (context, state) {
        if (state.stage == RideStage.finished) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                        (route) => false,
                      ),
                    ),
                    const Spacer(),
                    const BrandLogo(),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    size: 34,
                    color: Color(0xFF16A34A),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Manzilga yetib bordingiz!',
                  style: inter(20, FontWeight.w700, AppPalette.textDark),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppPalette.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      destination.title,
                      style: inter(13, FontWeight.w600, AppPalette.orange),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(height: 1, color: AppPalette.border),
                ),
                DriverAvatar(initial: driver.initial, size: 56),
                const SizedBox(height: 10),
                Text(
                  driver.name,
                  style: inter(15, FontWeight.w700, AppPalette.textDark),
                ),
                const SizedBox(height: 2),
                Text(
                  '${driver.car} • ${driver.plate}',
                  style: inter(11, FontWeight.w400, AppPalette.textGrey),
                ),
                const SizedBox(height: 18),
                Text(
                  'SAYOHATNI BAHOLANG',
                  style: inter(10, FontWeight.w700, AppPalette.textGrey),
                ),
                const SizedBox(height: 6),
                BlocBuilder<RideBloc, RideState>(
                  buildWhen: (previous, current) =>
                      previous.rating != current.rating,
                  builder: (context, state) => StarRating(
                    value: state.rating,
                    onChanged: (stars) => bloc.add(RideRatingChanged(stars)),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  maxLines: 3,
                  cursorColor: AppPalette.orange,
                  style: inter(13, FontWeight.w400, AppPalette.textDark),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppPalette.greyBg,
                    hintText: 'Izoh qoldiring (ixtiyoriy)...',
                    hintStyle: inter(13, FontWeight.w400, AppPalette.textGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (text) => bloc.add(RideCommentChanged(text)),
                ),
                const SizedBox(height: 12),
                PriceSummary(priceText: tariff.priceText, isCash: isCash),
                const SizedBox(height: 16),
                BlocBuilder<RideBloc, RideState>(
                  builder: (context, state) => PrimaryButton(
                    label: 'Baholash va yakunlash',
                    onPressed:
                        state.rating > 0 ? () => bloc.add(RideFinished()) : null,
                    isLoading: state.isSubmitting,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
