import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/constants/image_manager.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/widgets/form/currency_form_widget.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SizedBox(height: context.dynamicHeight(80)),
                  Text(
                    'Currency Converter',
                    style: context.textTheme.headlineSmall!.copyWith(color: context.theme.colorScheme.primary, fontSize: 30),
                  ),
                  SizedBox(height: context.dynamicHeight(30)),
                  Container(
                    width: context.dynamicWidth(100),
                    height: context.dynamicHeight(100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageManager.instance.loginBg),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                  color: context.theme.colorScheme.primary,
                ),
                child: Padding(
                  padding: context.paddingHighHorizontal,
                  child: const CurrencyFormWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
