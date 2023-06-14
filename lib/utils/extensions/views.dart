import 'package:animate_do/animate_do.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Widget networkImage(String imgUrl, {double height = 50, double width = 50}) {
  return FadeIn(
    child: Container(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => SizedBox(
            height: 25, width: 25, child: SizedBox(height: 25, width : 25, child: Lottie.asset('assets/lottie/loading.json',))),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
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

Widget textFormField(
    {required String valueKey,
    required TextEditingController controller,
    required bool enabled,
    required Function(String text) func,
    required int maxLength}) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
        child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter $valueKey";
              } else {
                return null;
              }
            },
            controller: controller,
            enabled: enabled,
            maxLength: maxLength,
            key: ValueKey(valueKey),
            onChanged: (value) {
              func(value);
            },
            style: const TextStyle(color: Colors.black),
            maxLines: valueKey.toLowerCase().contains("desc") ? 3 : 1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search_outlined,
                color: Colors.brown.shade700,
              ),
              focusColor: Colors.transparent,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black26, width: 1)),
              hoverColor: Colors.transparent,
              hintText: !enabled ? "Select $valueKey" : valueKey,
              filled: true,
              fillColor: Colors.white,
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black26, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black26, width: 1)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black26, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
            )),
      ),
    ),
  );
}

Widget headerText(String text, double size, {Color color = Colors.white}) {
  return AutoSizeText(
    text,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color, fontWeight: FontWeight.bold, fontSize: size)),
    minFontSize: size,
  );
}

Widget titleText(String text, double size) {
  return AutoSizeText(
    text,
    textAlign: TextAlign.start,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(color: Colors.white, fontSize: size)),
    minFontSize: 9,
  );
}

Widget paragraphText(String text, {double size = 10}) {
  return AutoSizeText(
    text,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(color: Colors.white, fontSize: size)),
    minFontSize: size,
  );
}

Widget buttonText(String text) {
  return AutoSizeText(
    text,
    style: GoogleFonts.poppins(
        textStyle: const TextStyle(color: Colors.white, fontSize: 10)),
    minFontSize: 9,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 15.0);
}
