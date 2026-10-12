import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/model/user_profile.dart';
import 'package:yandex_map/screen/login_screen.dart';
import 'package:yandex_map/screen/payment_screen.dart';
import 'package:yandex_map/widgets/cashback_card.dart';
import 'package:yandex_map/widgets/screen_header.dart';

import '../bloc/nav/nav_bloc.dart';
import '../bloc/nav/nav_event.dart';
import '../bloc/profile_event/profile_bloc.dart';
import '../bloc/profile_event/profile_event.dart';
import '../bloc/profile_event/profile_state.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_menu_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  void _soon(BuildContext context, String name) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text("$name bo'limi tez orada qo'shiladi")),
      );
  }

  void _goToTab(BuildContext context, int index) {
    context.read<NavBloc>().add(NavTabChanged(index));
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    const user = sampleUser;
    const divider = Divider(height: 1, color: AppPalette.border);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          children: [
            ScreenHeader(
              title: 'Profil',
              trailingIcon: Icons.settings_outlined,
              onTrailing: () => _soon(context, 'Sozlamalar'),
            ),
            const SizedBox(height: 8),
            ProfileHeaderCard(
              user: user,
              onEdit: () => _soon(context, 'Profilni tahrirlash'),
            ),
            const SizedBox(height: 12),
            CashbackCard(
              pointsText: user.pointsText,
              progress: user.rewardProgress,
              footnote: 'Keyingi mukofotga ${user.nextRewardIn} ball',
              onHistory: () => _goToTab(context, 2),
            ),
            const SizedBox(height: 12),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppPalette.border),
              ),
              child: Column(
                children: [
                  ProfileMenuTile(
                    icon: Icons.list_alt,
                    title: 'Buyurtmalar tarixi',
                    subtitle: '${user.rides} ta safar',
                    badge: '${user.rides}',
                    onTap: () => _goToTab(context, 1),
                  ),
                  divider,
                  ProfileMenuTile(
                    icon: Icons.credit_card,
                    title: "To'lov usullari",
                    subtitle: "Karta qo'shing",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentMethodsPage(),
                      ),
                    ),
                  ),
                  divider,
                  ProfileMenuTile(
                    icon: Icons.confirmation_number_outlined,
                    title: 'Promo kodlar',
                    onTap: () => _goToTab(context, 2),
                  ),
                  divider,
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) => ProfileMenuTile(
                      icon: Icons.notifications_none,
                      title: 'Bildirishnomalar',
                      trailing: Switch(
                        value: state.notificationsEnabled,
                        activeTrackColor: AppPalette.orange,
                        onChanged: (value) => context
                            .read<ProfileBloc>()
                            .add(ProfileNotificationsToggled(value)),
                      ),
                    ),
                  ),
                  divider,
                  ProfileMenuTile(
                    icon: Icons.help_outline,
                    title: 'Yordam va aloqa',
                    onTap: () => _soon(context, 'Yordam'),
                  ),
                  divider,
                  ProfileMenuTile(
                    icon: Icons.logout,
                    title: 'Chiqish',
                    color: const Color(0xFFDC2626),
                    trailing: const SizedBox.shrink(),
                    onTap: () => _logout(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
