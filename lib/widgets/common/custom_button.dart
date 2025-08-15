import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../constants/dimensions.dart';

enum ButtonType { primary, secondary, outline, text }
enum ButtonSize { small, medium, large }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final IconData? icon;
  final bool iconOnRight;
  final bool isLoading;
  final bool isFullWidth;
  final Color? customColor;
  final double? customWidth;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.iconOnRight = false,
    this.isLoading = false,
    this.isFullWidth = false,
    this.customColor,
    this.customWidth,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widget.isFullWidth ? double.infinity : widget.customWidth,
        height: _getButtonHeight(),
        child: ElevatedButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          style: _getButtonStyle(),
          child: _buildButtonContent(),
        ),
      ),
    );
  }

  double _getButtonHeight() {
    switch (widget.size) {
      case ButtonSize.small:
        return AppDimensions.buttonHeightSmall;
      case ButtonSize.medium:
        return AppDimensions.buttonHeight;
      case ButtonSize.large:
        return AppDimensions.buttonHeightLarge;
    }
  }

  ButtonStyle _getButtonStyle() {
    Color backgroundColor;
    Color foregroundColor;
    Color borderColor = Colors.transparent;

    switch (widget.type) {
      case ButtonType.primary:
        backgroundColor = widget.customColor ?? AppColors.primary;
        foregroundColor = AppColors.white;
        break;
      case ButtonType.secondary:
        backgroundColor = AppColors.gray100;
        foregroundColor = AppColors.textPrimary;
        break;
      case ButtonType.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = widget.customColor ?? AppColors.primary;
        borderColor = widget.customColor ?? AppColors.primary;
        break;
      case ButtonType.text:
        backgroundColor = Colors.transparent;
        foregroundColor = widget.customColor ?? AppColors.primary;
        break;
    }

    if (_isHovered && widget.onPressed != null) {
      switch (widget.type) {
        case ButtonType.primary:
          backgroundColor = widget.customColor?.withOpacity(0.8) ?? AppColors.primaryDark;
          break;
        case ButtonType.secondary:
          backgroundColor = AppColors.gray200;
          break;
        case ButtonType.outline:
          backgroundColor = (widget.customColor ?? AppColors.primary).withOpacity(0.1);
          break;
        case ButtonType.text:
          backgroundColor = (widget.customColor ?? AppColors.primary).withOpacity(0.1);
          break;
      }
    }

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: widget.type == ButtonType.primary ? 0 : 0,
      shadowColor: Colors.transparent,
      side: widget.type == ButtonType.outline
          ? BorderSide(color: borderColor, width: 2)
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.buttonPaddingHorizontal,
        vertical: AppDimensions.buttonPaddingVertical,
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.type == ButtonType.primary ? AppColors.white : AppColors.primary,
          ),
        ),
      );
    }

    List<Widget> children = [];

    if (widget.icon != null && !widget.iconOnRight) {
      children.add(Icon(widget.icon, size: AppDimensions.iconSmall));
      children.add(SizedBox(width: AppDimensions.spacing8));
    }

    children.add(
      Text(
        widget.text,
        style: _getTextStyle(),
      ),
    );

    if (widget.icon != null && widget.iconOnRight) {
      children.add(SizedBox(width: AppDimensions.spacing8));
      children.add(Icon(widget.icon, size: AppDimensions.iconSmall));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  TextStyle _getTextStyle() {
    TextStyle baseStyle;

    switch (widget.size) {
      case ButtonSize.small:
        baseStyle = AppTextStyles.buttonSmall;
        break;
      case ButtonSize.medium:
        baseStyle = AppTextStyles.buttonMedium;
        break;
      case ButtonSize.large:
        baseStyle = AppTextStyles.buttonLarge;
        break;
    }

    Color textColor;
    switch (widget.type) {
      case ButtonType.primary:
        textColor = AppColors.white;
        break;
      case ButtonType.secondary:
        textColor = AppColors.textPrimary;
        break;
      case ButtonType.outline:
      case ButtonType.text:
        textColor = widget.customColor ?? AppColors.primary;
        break;
    }

    return baseStyle.copyWith(color: textColor);
  }
}