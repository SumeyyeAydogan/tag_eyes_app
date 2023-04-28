import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/core/constants/application_constants.dart';
import 'package:tag_eyes_app/core/constants/register_constants.dart';
import 'package:tag_eyes_app/features/bottom_nav_bar/main_view.dart';
import 'package:tag_eyes_app/widgets/button/custom_elevated_button.dart';
import 'package:tag_eyes_app/widgets/input/login_form_input.dart';

class MyWalletWidget extends StatefulWidget {
  const MyWalletWidget({Key? key}) : super(key: key);

  @override
  State<MyWalletWidget> createState() => _MyWalletWidgetState();
}

class _MyWalletWidgetState extends State<MyWalletWidget> {
  final TextEditingController currTRY = TextEditingController();
  final TextEditingController currUSD = TextEditingController();
  final TextEditingController currEUR = TextEditingController();
  final TextEditingController currGBP = TextEditingController();
  final _walletFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _walletFormKey,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          buildTextFormFieldTRY(context),
          buildTextFormFieldUSD(context),
          buildTextFormFieldEUR(context),
          buildTextFormFieldGBP(context),
          buildSaveButton(context),
        ],
      ),
    );
  }

  buildTextFormFieldTRY(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        controller: currTRY,
        hintText: 'TRY',
        keyboardType: TextInputType.number,
        onSaved: (value) {
          currTRY.text = value!;
        },
        validator: FormBuilderValidators.required(errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldUSD(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        controller: currUSD,
        keyboardType: TextInputType.number,
        hintText: 'USD',
        onSaved: (value) {
          currUSD.text = value!;
        },
        validator: FormBuilderValidators.required(errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldEUR(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        controller: currEUR,
        keyboardType: TextInputType.number,
        hintText: 'EUR',
        onSaved: (value) {
          currEUR.text = value!;
        },
        validator: FormBuilderValidators.required(errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldGBP(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        controller: currGBP,
        keyboardType: TextInputType.number,
        hintText: 'GBP',
        onSaved: (value) {
          currGBP.text = value!;
        },
        validator: FormBuilderValidators.required(errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: CustomElevationButton(
        primaryColor: context.theme.colorScheme.primary,
        minimumSize: Size(context.width, context.highValue),
        onPressed: () async {
          if (_walletFormKey.currentState != null && _walletFormKey.currentState!.validate()) {
            _walletFormKey.currentState!.save();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLogin', true);
            await prefs.setString('TRY', currTRY.text);
            await prefs.setString('USD', currUSD.text);
            await prefs.setString('EUR', currEUR.text);
            await prefs.setString('GBP', currGBP.text);
            currTRY.clear();
            currUSD.clear();
            currEUR.clear();
            currGBP.clear();
          }
        },
        title: CurrencyConstants.SAVE,
      ),
    );
  }
}
