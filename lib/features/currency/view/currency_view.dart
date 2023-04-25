import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/constants/image_manager.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/widgets/form/currency_form_widget.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Currency Converter',
                style: context.textTheme.headlineSmall!.copyWith(
                    color: context.theme.colorScheme.primary, fontSize: 36),
              ),
              const SizedBox(height: 50),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageManager.instance.loginBg))),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(40)),
                  color: context.theme.colorScheme.primary,
                ),
                child: Padding(
                  padding: context.paddingHighVerticalAndHorizontal,
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
