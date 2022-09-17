import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class AppInput extends StatefulWidget {
  const AppInput.primary({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.errorText,
    this.icon,
    this.obscureText = false,
    this.showHiddenInput,
    this.keyboardType,
    this.textInputAction,
    this.border = const OutlineInputBorder(),
    this.controller,
    this.style,
  });

  final String? icon;
  final String hintText;
  final bool obscureText;
  final String? errorText;
  final VoidCallback? showHiddenInput;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final InputBorder? border;
  final TextStyle? style;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  String textBeingTyped = '';
  bool showErrorTooltip = false;

  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  bool get inputIsFilled => textBeingTyped.isNotEmpty;
  bool get inputIsInvalid => widget.errorText != null;

  void _remember(String text) {
    setState(() {
      textBeingTyped = text;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {
      showErrorTooltip = !_focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: (String str) {
        if (widget.onChanged != null) {
          widget.onChanged!(str);
        }

        _remember(str);
      },
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style ??
          context.textTheme.titleLarge
              ?.copyWith(color: ColorPalettes.primary40),
      cursorColor: ColorPalettes.primary40,
      decoration: InputDecoration(
        fillColor: ColorPalettes.primary40,
        hintText: widget.hintText,
        errorText: inputIsFilled && inputIsInvalid && _focusNode.hasFocus
            ? widget.errorText
            : null,
        hintStyle: context.textTheme.titleSmall
            ?.copyWith(color: ColorPalettes.neutralVariant50),
        border: widget.border,
        enabledBorder: widget.border,
      ),
    );
  }
}
