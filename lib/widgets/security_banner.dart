import 'package:flutter/material.dart';

import '../core/peyment.dart';


class SecurityBanner extends StatelessWidget {
  const SecurityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: PaymentColors.greenSoft,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.verified_user_outlined,
            color: PaymentColors.green,
            size: 22,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Barcha to\'lovlar shifrlangan va xavfsiz',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: PaymentColors.green,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'PCI DSS standartiga mos · SSL sertifikat',
                  style: TextStyle(fontSize: 12, color: PaymentColors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}