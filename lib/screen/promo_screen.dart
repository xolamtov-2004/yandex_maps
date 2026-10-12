
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/user_profile.dart';
import 'package:yandex_map/widgets/cashback_card.dart';
import 'package:yandex_map/widgets/promo/promo_code_input.dart';
import 'package:yandex_map/widgets/promo/promotion_card.dart';
import 'package:yandex_map/widgets/screen_header.dart';

import '../bloc/nav/nav_bloc.dart';
import '../bloc/nav/nav_event.dart';
import '../bloc/promo/promo.bloc.dart';
import '../bloc/promo/promo_event.dart';
import '../bloc/promo/promo_state.dart';
import '../model/order.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PromoBloc(),
      child: const _PromoView(),
    );
  }
}

class _PromoView extends StatelessWidget {
  const _PromoView();

  void _showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    const user = sampleUser;
    final bloc = context.read<PromoBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: BlocBuilder<PromoBloc, PromoState>(
          builder: (context, state) {
            final isApplied = state.status == PromoStatus.applied;

            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              children: [
                ScreenHeader(
                  title: 'Aksiyalar & Cashback',
                  leadingIcon: Icons.arrow_back,
                  onLeading: () =>
                      context.read<NavBloc>().add(NavTabChanged(0) as NavEvent),
                  trailingIcon: Icons.notifications_none,
                  onTrailing: () =>
                      _showMessage(context, "Yangi bildirishnomalar yo'q"),
                ),
                const SizedBox(height: 8),
                CashbackCard(
                  pointsText: user.pointsText,
                  progress: user.rewardProgress,
                  footnote: 'Keyingi mukofotga ${user.nextRewardIn} ball qoldi',
                  onHistory: () =>
                      context.read<NavBloc>().add(NavTabChanged(1)),
                  buttonLabel: state.useCashback
                      ? 'Cashback yoqildi ✓'
                      : 'Cashback ishlatish',
                  onButton: () => bloc.add(PromoCashbackToggled()),
                ),
                const SizedBox(height: 20),
                Text(
                  'Promo kod kiritish',
                  style: inter(14, FontWeight.w700, AppPalette.textDark),
                ),
                const SizedBox(height: 10),
                PromoCodeInput(
                  onChanged: (code) => bloc.add(PromoCodeChanged(code)),
                  onApply: () => bloc.add(PromoApplied()),
                ),
                if (state.message.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        isApplied ? Icons.check : Icons.error_outline,
                        size: 14,
                        color: isApplied
                            ? const Color(0xFF16A34A)
                            : const Color(0xFFDC2626),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          state.message,
                          style: inter(
                            11,
                            FontWeight.w600,
                            isApplied
                                ? const Color(0xFF16A34A)
                                : const Color(0xFFDC2626),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Faol aksiyalar',
                      style: inter(14, FontWeight.w700, AppPalette.textDark),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppPalette.orangeBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${samplePromotions.length} ta',
                        style: inter(10, FontWeight.w700, AppPalette.orange),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                for (final promotion in samplePromotions)
                  PromotionCard(
                    promotion: promotion,
                    onTerms: () => _showMessage(
                      context,
                      '${promotion.title}: ${promotion.description}',
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}