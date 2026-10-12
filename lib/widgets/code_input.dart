import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yandex_map/core/app_text.dart';
import '../core/app_colors.dart';
/// Olti katakli SMS kod maydoni.
/// Kataklar ustida ko'rinmas TextField turadi: bosilganda klaviatura ochiladi.
class CodeInput extends StatelessWidget {
  final String code;
  final int length;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const CodeInput({
    super.key,
    required this.code,
    required this.length,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Row(
            children: [
              for (var i = 0; i < length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(
                  child: _CodeBox(
                    char: i < code.length ? code[i] : null,
                    isCurrent: i == code.length,
                  ),
                ),
              ],
            ],
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: true,
                keyboardType: TextInputType.number,
                showCursor: false,
                enableInteractiveSelection: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(length),
                ],
                decoration: const InputDecoration(border: InputBorder.none),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeBox extends StatelessWidget {
  final String? char;
  final bool isCurrent;

  const _CodeBox({required this.char, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    final isHighlighted = char != null || isCurrent;

    Widget? child;
    if (char != null) {
      child = Text(char!, style: inter(22, FontWeight.w700, AppPalette.textDark));
    } else if (isCurrent) {
      child = Container(width: 2, height: 24, color: AppPalette.orange);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.white : AppPalette.greyBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHighlighted ? AppPalette.orange : AppPalette.border,
          width: isHighlighted ? 1.5 : 1,
        ),
      ),
      child: child,
    );
  }
}