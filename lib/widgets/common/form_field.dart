import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../constants/dimensions.dart';

class CustomFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool isRequired;
  final bool isTextArea;
  final bool isEmail;
  final bool isPhone;
  final int maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomFormField({
    Key? key,
    this.label,
    this.hint,
    this.initialValue,
    this.isRequired = false,
    this.isTextArea = false,
    this.isEmail = false,
    this.isPhone = false,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _isFocused = false;
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();

    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          _buildLabel(),
          SizedBox(height: AppDimensions.spacing8),
        ],
        _buildFormField(),
      ],
    );
  }

  Widget _buildLabel() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.label!,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          if (widget.isRequired)
            TextSpan(
              text: ' *',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFormField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _getBorderColor(),
            width: 2,
          ),
        ),
      ),
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        obscureText: widget.obscureText,
        maxLines: widget.isTextArea ? 4 : widget.maxLines,
        keyboardType: _getKeyboardType(),
        onChanged: widget.onChanged,
        validator: widget.validator ?? _getDefaultValidator(),
        style: AppTextStyles.formField.copyWith(
          color: widget.enabled ? AppColors.textPrimary : AppColors.textLight,
        ),
        decoration: InputDecoration(
          hintText: widget.hint ?? _getDefaultHint(),
          hintStyle: AppTextStyles.formHint.copyWith(
            color: _getHintColor(),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppDimensions.spacing12,
            horizontal: 0,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          filled: false,
        ),
      ),
    );
  }

  Color _getBorderColor() {
    if (!widget.enabled) {
      return AppColors.gray300;
    }
    if (_isFocused) {
      return AppColors.primary;
    }
    if (widget.isRequired && _controller.text.isEmpty) {
      return AppColors.primary;
    }
    return AppColors.gray300;
  }

  Color _getHintColor() {
    if (widget.isRequired) {
      return AppColors.primary;
    }
    return AppColors.textLight;
  }

  TextInputType? _getKeyboardType() {
    if (widget.keyboardType != null) return widget.keyboardType;
    if (widget.isEmail) return TextInputType.emailAddress;
    if (widget.isPhone) return TextInputType.phone;
    if (widget.isTextArea) return TextInputType.multiline;
    return TextInputType.text;
  }

  String? _getDefaultHint() {
    if (widget.isEmail) return 'Enter your email address';
    if (widget.isPhone) return 'Enter your phone number';
    if (widget.isTextArea) return 'Enter your message';
    return null;
  }

  String? Function(dynamic value) _getDefaultValidator() {
    return (value) {
      if (widget.isRequired && (value == null || value.isEmpty)) {
        return 'This field is required';
      }

      return null;
    };
  }
}