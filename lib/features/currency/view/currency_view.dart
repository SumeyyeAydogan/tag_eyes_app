import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/widgets/form/currency_form_widget.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
            color: context.theme.colorScheme.primary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  color: Colors.white, //Colors.transparent,
                ),
              ),
              Padding(
                padding: context.paddingHighVerticalAndHorizontal,
                child: const CurrencyFormWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
