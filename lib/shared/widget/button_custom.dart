import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:playground_bloc/shared/styles/color_style.dart";

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    this.name,
    this.onPressed,
    this.isOutlined = false,
    this.isIconSuffix = false,
    this.borderColor,
    this.icon,
    this.textStyle,
    this.borderWidth,
    this.borderRadius,
    this.size,
    this.padding,
    this.elevation,
    this.iconSize,
    this.iconColor,
    this.color,
    this.onPressColor,
    this.isGradient = false,
    this.gradientColor,
    this.isDisabled = false, // NEW: Disable Button
    this.disabledColor, // NEW: Custom Disabled Color
    this.onPressedDisabled,
  });

  final String? name;
  final void Function()? onPressed;
  final bool isOutlined;
  final bool isIconSuffix;
  final Color? borderColor;
  final double? borderWidth;
  final String? icon;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Size? size;
  final EdgeInsets? padding;
  final double? elevation;
  final double? iconSize;
  final Color? iconColor;
  final Color? color;
  final Color? onPressColor; // NEW: Ink splash/highlight color on press
  final bool isGradient;
  final List<Color>? gradientColor;
  final bool isDisabled; // NEW: Disable Button
  final Color? disabledColor; // NEW: Custom Disabled Color
  final void Function()? onPressedDisabled;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 8);

    final decoration = BoxDecoration(
      borderRadius: radius,
      color:
          isDisabled
              ? disabledColor ?? Colors.grey.shade400
              : (isGradient ? null : color ?? ColorStyle.primary),
      gradient:
          isDisabled
              ? null
              : (isGradient
                  ? LinearGradient(
                    colors:
                        gradientColor ??
                        [ColorStyle.primaryGradient, ColorStyle.primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : null),
      boxShadow:
          elevation != null && !isDisabled
              ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: elevation!,
                  offset: const Offset(0, 2),
                ),
              ]
              : null,
      border:
          isOutlined
              ? Border.all(
                color: isDisabled ? Colors.grey : borderColor ?? Colors.white,
                width: borderWidth ?? 1,
              )
              : null,
    );

    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: decoration,
        child: InkWell(
          borderRadius: radius,
          onTap: isDisabled ? onPressedDisabled : onPressed,
          splashColor: onPressColor,
          highlightColor: onPressColor?.withOpacity(0.12),
          overlayColor:
              onPressColor != null
                  ? WidgetStatePropertyAll(onPressColor)
                  : null,
          child: Container(
            width: size?.width ?? double.infinity,
            height: size?.height ?? 54,
            padding: padding ?? const EdgeInsets.symmetric(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null && !isIconSuffix) ...[
                  SvgPicture.asset(
                    icon!,
                    width: iconSize,
                    height: iconSize,
                    colorFilter: ColorFilter.mode(
                      isDisabled
                          ? Colors.grey.shade700
                          : (iconColor ?? Colors.white),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
                Text(
                  name ?? "Lanjut",
                  style:
                      textStyle ??
                      TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: isDisabled ? Colors.grey.shade700 : Colors.white,
                      ),
                ),
                if (icon != null && isIconSuffix) ...[
                  SizedBox(width: 8),
                  SvgPicture.asset(
                    icon!,
                    width: iconSize,
                    height: iconSize,
                    colorFilter: ColorFilter.mode(
                      isDisabled
                          ? Colors.grey.shade700
                          : (iconColor ?? Colors.white),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
