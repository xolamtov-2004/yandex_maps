


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/bloc/login/login_bloc.dart';
import 'package:yandex_map/bloc/login/login_event.dart';
import 'package:yandex_map/bloc/login/login_state.dart';
import 'package:yandex_map/core/app_text.dart';
import '../core/app_colors.dart';
import '../widgets/app_black_button.dart';
import '../widgets/phone_field.dart';
import '../widgets/phone_hint_row.dart';
import '../widgets/primary_button.dart';
import '../widgets/register_link.dart';
import '../widgets/sms_code_sender.dart';
import '../widgets/step_progress.dart';
import '../widgets/terms_text.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    context.read<LoginBloc>().add(LoginFocusChanged(_focusNode.hasFocus));
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    _focusNode.unfocus();
    context.read<LoginBloc>().add(LoginSubmitted());
  }

  void _onStatusChanged(BuildContext context, LoginState state) {
    if (state.status == LoginStatus.success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SmsCodeScreen(phone: state.fullPhone),
        ),
      );
    } else if (state.status == LoginStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error ?? 'Xatolik yuz berdi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _onStatusChanged,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppBackButton(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            'Kirish',
                            style: inter(
                              26,
                              FontWeight.w700,
                              AppPalette.textDark,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Telefon raqamingizni kiriting',
                            style: inter(
                              13,
                              FontWeight.w400,
                              AppPalette.textGrey,
                            ),
                          ),
                          const SizedBox(height: 24),
                          if (state.isFocused) ...[
                            Text(
                              'TELEFON RAQAM',
                              style: inter(
                                10,
                                FontWeight.w700,
                                AppPalette.orange,
                              ),
                            ),
                            const SizedBox(height: 6),
                          ],
                          PhoneField(
                            controller: _controller,
                            focusNode: _focusNode,
                            isFocused: state.isFocused,
                            onChanged: (value) => context
                                .read<LoginBloc>()
                                .add(LoginPhoneChanged(value)),
                            onSubmitted: _submit,
                          ),
                          const SizedBox(height: 10),
                          PhoneHintRow(
                            showCounter: state.isFocused,
                            count: state.phone.length,
                            max: LoginState.phoneLength,
                          ),
                          if (state.isFocused) ...[
                            const SizedBox(height: 20),
                            const StepProgress(step: 1),
                          ],
                          const SizedBox(height: 28),
                          const Center(child: RegisterLink()),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  PrimaryButton(
                    label: 'Davom etish',
                    onPressed: state.isValid ? _submit : null,
                    isLoading: state.isLoading,
                  ),
                  const SizedBox(height: 12),
                  const TermsText(),
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

