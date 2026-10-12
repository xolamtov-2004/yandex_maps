


import 'package:flutter/material.dart';

import '../core/peyment.dart';
import '../model/payment_method.dart';
import '../widgets/action_title.dart';
import '../widgets/method_title.dart';
import '../widgets/payment_bottom_bar.dart';
import '../widgets/section_label.dart';
import '../widgets/security_banner.dart';



class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({
    super.key,
    this.initialMethodId = 'cash',
    this.onAddCard,
    this.onOpenWallet,
  });

  final String initialMethodId;
  final VoidCallback? onAddCard;
  final VoidCallback? onOpenWallet;

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  late String _selectedId = widget.initialMethodId;

  // Backenddan kelganda shu ro'yxatni almashtirasiz.
  static const List<PaymentMethod> _methods = [
    PaymentMethod(
      id: 'cash',
      title: 'Naqd pul',
      subtitle: 'Safar tugagach to\'lash',
      icon: Icons.payments_outlined,
      iconColor: PaymentColors.orange,
      iconBg: PaymentColors.orangeSoft,
    ),
    PaymentMethod(
      id: 'uzcard_4521',
      title: 'Uzcard •••• 4521',
      subtitle: 'Amal qilish: 08/28',
      icon: Icons.credit_card,
      iconColor: Color(0xFF2563EB),
      iconBg: Color(0xFFE8EFFE),
      badge: 'Asosiy',
    ),
    PaymentMethod(
      id: 'humo_7834',
      title: 'Humo •••• 7834',
      subtitle: 'Amal qilish: 10/26',
      icon: Icons.credit_card,
      iconColor: Color(0xFF0EA5E9),
      iconBg: Color(0xFFE3F4FD),
    ),
  ];

  PaymentMethod get _selected => _methods.firstWhere(
        (m) => m.id == _selectedId,
    orElse: () => _methods.first,
  );

  void _save() => Navigator.of(context).maybePop(_selectedId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaymentColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'Orqaga',
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: PaymentColors.text,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'To\'lov usullari',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: PaymentColors.text,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Bildirishnomalar',
            icon: const Icon(Icons.notifications, color: PaymentColors.text),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: PaymentColors.border),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          const SectionLabel('ASOSIY TO\'LOV'),
          const SizedBox(height: 10),
          for (final m in _methods) ...[
            MethodTile(
              method: m,
              selected: m.id == _selectedId,
              onTap: () => setState(() => _selectedId = m.id),
            ),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 12),
          const SectionLabel('YANGI TO\'LOV USULI'),
          const SizedBox(height: 10),
          ActionTile(
            icon: Icons.add,
            iconColor: PaymentColors.text,
            iconBg: const Color(0xFFF1F2F4),
            title: 'Karta qo\'shish',
            subtitle: 'Visa, Mastercard, Uzcard, Humo',
            onTap: widget.onAddCard,
          ),
          const SizedBox(height: 10),
          ActionTile(
            icon: Icons.account_balance_wallet_outlined,
            iconColor: PaymentColors.orange,
            iconBg: PaymentColors.orangeSoft,
            title: 'YangiGO Wallet',
            subtitle: 'To\'g\'ridan-to\'g\'ri balansdan to\'lash',
            badge: 'Yangi',
            onTap: widget.onOpenWallet,
          ),
          const SizedBox(height: 16),
          const SecurityBanner(),
        ],
      ),
      bottomNavigationBar: PaymentBottomBar(
        selectedTitle: _selected.shortTitle,
        onSave: _save,
      ),
    );
  }
}