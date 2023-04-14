import 'package:flutter/material.dart';

class LoginInputFormField extends TextFormField {
  LoginInputFormField(
      {Key? key,
      String? title,
      bool isSecure = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      String? Function(String?)? validator,
      bool? filled,
      Color? filledColor,
      TextEditingController? controller,
      void Function(String?)? onSaved,
      GestureTapCallback? onTap})
      : super(
          key: key,
          controller: controller,
          onChanged: (text) {
            print("onchanged çalıştı");
          },
          validator: validator,
          onSaved: onSaved,
          onTap: onTap,
          obscureText: isSecure,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.blue,
          //initialValue: "", //Bu değişecek
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelText: title ?? "E-Posta Adresi",
              //labelStyle: TextStyle(fontFamily: 'Noto SansGrantha', color: Color(0xff564E46)),
              fillColor: Colors.white70,//const Color(0xffB4B4B4).withOpacity(0.2),
              filled: true,
              errorStyle:
                  const TextStyle(color: Colors.red, fontFamily: 'Urbanist'),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffB4B4B4)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffB4B4B4)),
              )),
        );
}
