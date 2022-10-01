import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moli_app/constants/constants.dart';

import '../../shared.dart';

class FloatingLabelInput extends StatefulWidget {
  const FloatingLabelInput({
    super.key,
    this.hintText,
    required this.labelText,
    required this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.icon,
    this.obscureText = false,
    this.showHiddenInput,
    this.keyboardType,
    this.textInputAction,
    this.border,
    this.inputFormatters,
    this.noteInitValue,
    this.enabled,
    this.validator,
  });

  final String? noteInitValue;
  final String? icon;
  final String? hintText;
  final String labelText;
  final bool obscureText;
  final bool? enabled;
  final String? errorText;
  final VoidCallback? showHiddenInput;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputBorder? border;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  State<FloatingLabelInput> createState() => _FloatingLabelInputState();
}

class _FloatingLabelInputState extends State<FloatingLabelInput> {
  String textBeingTyped = '';
  bool showErrorTooltip = false;
  late bool obscureText;
  final FocusNode _focusNode = FocusNode();
  // final TextEditingController _controller = TextEditingController();

  bool get inputIsFilled => textBeingTyped.isNotEmpty;
  bool get inputIsInvalid => widget.errorText != null;

  void _remember(String text) {
    setState(
      () {
        textBeingTyped = text;
      },
    );
  }

  @override
  void initState() {
    obscureText = widget.obscureText;
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

  void showHidenInput() {
    setState(() => obscureText = !obscureText);
    if (widget.showHiddenInput != null) {
      widget.showHiddenInput!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        TextFormField(
          initialValue: widget.noteInitValue,
          focusNode: _focusNode,
          enabled: widget.enabled,
          // controller: _controller,
          onFieldSubmitted: widget.onSubmitted,
          onChanged: (String str) {
            if (widget.onChanged != null) {
              widget.onChanged!(str);
            }
            _remember(str);
          },
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          obscureText: obscureText,
          obscuringCharacter: '*',
          textInputAction: widget.textInputAction,
          style: context.textTheme.bodyLarge,
          cursorColor: ColorPalettes.primary40,
          cursorRadius: const Radius.circular(29),
          validator: widget.validator,
          decoration: InputDecoration(
            fillColor: ColorPalettes.white,
            hintText: widget.hintText,
            errorText: inputIsFilled && inputIsInvalid && _focusNode.hasFocus
                ? widget.errorText
                : null,
            hintStyle: context.textTheme.titleSmall
                ?.copyWith(color: ColorPalettes.primary40.withOpacity(0.5)),
            label: widget.icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AppIcon(widget.icon!, color: ColorPalettes.neutral80),
                      const SizedBox(width: 12),
                      Text(
                        widget.labelText,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: ColorPalettes.neutral80,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : null,
            labelStyle: context.textTheme.headlineLarge,
            suffix: (widget.showHiddenInput != null)
                ? GestureDetector(
                    onTap: showHidenInput,
                    child: AppIcon(
                      obscureText ? IconAssets.icEye : IconAssets.icEyeSlash,
                      color: ColorPalettes.neutral80,
                    ),
                  )
                : null,
            border: widget.border,
            enabledBorder: widget.border,
          ),
        ),
      ],
    );
  }
}
