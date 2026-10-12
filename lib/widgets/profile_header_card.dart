

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/user_profile.dart';

class ProfileHeaderCard extends StatelessWidget {
  final UserProfile user;
  final VoidCallback onEdit;

  const ProfileHeaderCard({
    super.key,
    required this.user,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppPalette.orange,
                    child: Text(
                      user.initial,
                      style: inter(22, FontWeight.w700, Colors.white),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: inter(16, FontWeight.w700, AppPalette.textDark),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.phone,
                      style: inter(12, FontWeight.w400, AppPalette.textGrey),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          size: 14,
                          color: AppPalette.orange,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${user.rating}',
                          style: inter(11, FontWeight.w700, AppPalette.orange),
                        ),
                        Text(
                          ' · ${user.rides} safar',
                          style:
                          inter(11, FontWeight.w400, AppPalette.textGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: TextButton.icon(
              onPressed: onEdit,
              icon: const Icon(Icons.edit_outlined, size: 16),
              label: Text(
                'Profilni tahrirlash',
                style: inter(12, FontWeight.w600, AppPalette.textDark),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppPalette.greyBg,
                foregroundColor: AppPalette.textDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}