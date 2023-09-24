import 'package:flutter/material.dart';

typedef ContextCallback = void Function(BuildContext context);

class Button extends StatelessWidget {

  /// Button text content
  final String buttonText;

  /// Button text color
  final Color? buttonTextColor;

  /// Button colour
  final Color buttonColor;

  /// Button text style;
  final TextStyle? buttonTextStyle;


  /// CircularProgressIndicator's color
  final Color? loadingColor;

  /// To check either to show ProgressIndicator or not
  final bool isLoading;

  /// When user presses, the button will trigger this function
  final ContextCallback? onPressed;


  /// ButtonSkeleton constructor
  const Button({
    super.key,
    required this.buttonText,
    this.buttonColor = Colors.yellow,
    this.buttonTextColor = Colors.white,
    this.buttonTextStyle,
    this.loadingColor = Colors.purpleAccent,
    this.isLoading = false,
    this.onPressed,
    // this.overlayColor = ThemeColor.gray500,
    // this.onLongPressed,
    // this.disabledButtonColor = ThemeColor.gray50,
    // this.disabledButtonTextColor = ThemeColor.gray500,
    // this.enableFeedback = false,
    // this.loaderColor = ThemeColor.blue300,
    // this.icon,
    // this.iconColor,
    // this.disabledIconColor,
    // this.bordSide
  });

  @override
  Widget build(BuildContext context) {

    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            fixedSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.06
            )
        ),
        onPressed: isLoading || onPressed == null ? null : () => onPressed!(context),
        child: isLoading ?
        Center(
          child: SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              color: loadingColor,
              strokeWidth: 1,
            ),
          ),
        )
        :
        Text(
          buttonText,
          style: buttonTextStyle ??
              TextStyle(
              color: buttonTextColor
          ),
        )
    );
  }
}