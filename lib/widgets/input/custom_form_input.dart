import 'package:flutter/material.dart';

import '../icon/secure_icon.dart';
import 'login_password_input.dart';

class LoginPasswordCustomField extends StatefulWidget {
  final String? title;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const LoginPasswordCustomField(
      {Key? key, this.title, this.controller, this.onSaved, this.validator})
      : super(key: key);

  @override
  _LoginPasswordCustomFieldState createState() =>
      _LoginPasswordCustomFieldState();
}

class _LoginPasswordCustomFieldState extends State<LoginPasswordCustomField> {
  bool _isSecureText = true;
  void _changeSecure() {
    setState(() {
      _isSecureText = !_isSecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginPasswordInputField(
      prefixIcon: const Icon(Icons.lock),
      isSecure: _isSecureText,
      title: widget.title,
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      suffixIcon: IconButton(
          onPressed: () {
            _changeSecure();
          },
          icon: SecureIcon(
            isSecure: _isSecureText,
          )),
    );
  }
}
