import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets margin;
  final double height;
  final double width;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  final bool showBorder;
  final double borderWidth;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool boldText;
  final bool isLoading;
  final Widget? image;

  // Change the default value of width to a constant
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.transparent = false,
    this.margin = EdgeInsets.zero,
    this.width = 1170,
    this.height = 45,
    this.fontSize,
    this.iconColor,
    this.radius = 50,
    this.icon,
    this.image,
    this.showBorder = false,
    this.borderWidth = 1,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.boldText = true,
  });
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: backgroundColor ??
          (onPressed == null
              ? Theme.of(context).disabledColor
              : transparent
              ? Colors.transparent
              : Theme.of(context).primaryColor),
      minimumSize: Size(width, height),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius), // Use ScreenUtil here
        side: showBorder
            ? BorderSide(
          color: borderColor ?? Theme.of(context).primaryColor,
          width: borderWidth,
        )
            : BorderSide(color: Colors.transparent),
      ),
    );

    return AbsorbPointer(
      absorbing: isLoading,
      child: Center(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: margin,
            child: TextButton(
              onPressed: onPressed,
              style: flatButtonStyle,
              child: isLoading
                  ? Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(7.0)), // Use ScreenUtil here
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: backgroundColor ?? Colors.white,
                ),
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(5.0), // Use ScreenUtil here
                      ),
                      child: Icon(
                        icon,
                        color: transparent
                            ? Theme.of(context).primaryColor
                            : iconColor ?? Colors.white,
                      ),
                    )
                  else
                    const SizedBox(),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: boldText
                        ? TextStyle(
                      color: textColor ??
                          (transparent
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                      fontSize: fontSize ??
                          ScreenUtil().setSp(18.0), // Use ScreenUtil here
                      fontWeight: FontWeight.normal,
                    )
                        : TextStyle(
                      color: textColor ??
                          (transparent
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                      fontSize: fontSize ??
                          ScreenUtil().setSp(20.0), // Use ScreenUtil here
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
