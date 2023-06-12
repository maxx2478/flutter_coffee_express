import 'package:animate_do/animate_do.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget networkImage(String img_url) {
  return FadeIn(
    child: CachedNetworkImage(
      imageUrl: img_url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            /*colorFilter: const ColorFilter.mode(
              Colors.red,
              BlendMode.colorBurn,
            )*/
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}

Widget animatedDigit(AnimatedDigitController controller, String prefix,
    bool enableSeparator, Color color) {
  return AnimatedDigitWidget(
      value: controller.value,
      // or use controller
      textStyle: TextStyle(color: color, fontSize: 16),
      fractionDigits: 2,
      enableSeparator: enableSeparator,
      separateSymbol: "·",
      separateLength: 3,
      decimalSeparator: ",",
      prefix: prefix);
}

Widget paragraphText(String text)
{
  return AutoSizeText(
    text,
    style: const TextStyle(fontSize: 12),
    minFontSize: 12,
  );
}

Widget buttonText(String text)
{
  return AutoSizeText(
    text,
    style: const TextStyle(fontSize: 15),
    minFontSize: 15,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

void showToast(String msg)
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 15.0
  );
}