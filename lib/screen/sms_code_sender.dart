


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/bloc/sms/sms_bloc.dart';
import 'package:yandex_map/bloc/sms/sms_event.dart';

import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/screen/main_screen.dart';
import 'package:yandex_map/widgets/primary_button.dart';
import 'package:yandex_map/widgets/resender_timer.dart';
import 'package:yandex_map/widgets/step_progress.dart';
import 'package:yandex_map/widgets/terms_text.dart';

import '../bloc/sms/sms_state.dart';
import '../core/app_colors.dart';
import '../widgets/app_black_button.dart';
import '../widgets/code_input.dart';



class SmsCodeScreen extends StatelessWidget {
  final String phone;

  const SmsCodeScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SmsBloc(phone: phone)..add(SmsStarted()),
      child: _SmsCodeView(phone: phone),
    );
  }
}

class _SmsCodeView extends StatefulWidget {
  final String phone;

  const _SmsCodeView({required this.phone});

  @override
  State<_SmsCodeView> createState() => _SmsCodeViewState();
}

class _SmsCodeViewState extends State<_SmsCodeView> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onStateChanged(BuildContext context, SmsState state) {
    // Bloc kodni tozalasa (qayta yuborishda), maydon ham tozalanadi.
    if (_controller.text != state.code) {
      _controller.text = state.code;
    }

    if (state.status == SmsStatus.success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
        (route) => false,
      );
    } else if (state.status == SmsStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error ?? "Kod noto'g'ri")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SmsBloc>();

    return BlocConsumer<SmsBloc, SmsState>(
      listenWhen: (previous, current) =>
      previous.status != current.status || previous.code != current.code,
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const AppBackButton(icon: Icons.arrow_back),
                  const SizedBox(height: 20),
                  Text(
                    'SMS kodni kiriting',
                    style: inter(24, FontWeight.w700, AppPalette.textDark),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      style: inter(12, FontWeight.w400, AppPalette.textGrey),
                      children: [
                        TextSpan(
                          text: widget.phone,
                          style: inter(
                            12,
                            FontWeight.w700,
                            AppPalette.textDark,
                          ),
                        ),
                        const TextSpan(text: ' ga yuborildi'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const StepProgress(step: 2),
                  const SizedBox(height: 24),
                  CodeInput(
                    code: state.code,
                    length: SmsState.codeLength,
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: (value) => bloc.add(SmsCodeChanged(value)),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ResendTimer(
                      canResend: state.canResend,
                      timerText: state.timerText,
                      onResend: () => bloc.add(SmsResendPressed()),
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: 'Tasdiqlash →',
                    onPressed: state.isComplete
                        ? () => bloc.add(SmsSubmitted())
                        : null,
                    isLoading: state.isLoading,
                  ),
                  const SizedBox(height: 12),
                  const Center(child: TermsText()),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}