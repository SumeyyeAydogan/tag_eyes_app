import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/widgets/custom_page.dart';
import 'package:tag_eyes_app/widgets/form/currency_form_widget.dart';

import '../../../core/constants/image_manager.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),//const BorderRadius.vertical(top: Radius.circular(50)),
          color: context.theme.colorScheme.primary,
          /* image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImageManager.instance.introductionBg)), */
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 0,
              child: Container(
                color: Colors.white,//Colors.transparent,
              ),
            ),
            Padding(
              padding: context.paddingHighVerticalAndHorizontal,
              child: CurrencyFormWidget(),
            ),
          ],
      ),
    ),
        ));
  }
}
