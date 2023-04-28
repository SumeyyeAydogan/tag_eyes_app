import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/core/constants/application_constants.dart';
import 'package:tag_eyes_app/core/constants/register_constants.dart';
import 'package:tag_eyes_app/features/bottom_nav_bar/main_view.dart';
import 'package:tag_eyes_app/widgets/button/custom_elevated_button.dart';
import 'package:tag_eyes_app/widgets/input/login_form_input.dart';

class CurrencyFormWidget extends StatefulWidget {
  const CurrencyFormWidget({Key? key}) : super(key: key);

  @override
  State<CurrencyFormWidget> createState() => _CurrencyFormWidgetState();
}

class _CurrencyFormWidgetState extends State<CurrencyFormWidget> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _emailText = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          buildSelectImage(context),
          buildTextFormFieldName(context),
          buildTextFormFieldEmail(context),
          const Text('Which currency do you use?'),
          buildTextFormFieldFirstCurr(context),
          const Text('Could you please select the currency you want to convert?'),
          buildTextFormFieldSecondCurr(context),
          buildRegisterButton(context),
        ],
      ),
    );
  }

  buildSelectImage(BuildContext context) {
    return const Icon(Icons.person, size: 50);
  }

  buildTextFormFieldName(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        hintText: 'Name',
        controller: _fullName,
        onSaved: (value) {
          _fullName.text = value!;
        },
        validator: FormBuilderValidators.required(errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldEmail(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        controller: _emailText,
        hintText: 'E-mail',
        onSaved: (value) {
          _emailText.text = value!;
        },
        validator: FormBuilderValidators.required(errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  List<String> dropdownButtonList1 = [
    'USD',
    'EUR',
    'GBP',
    'CHF',
    'TRY',
  ];
  List<String> dropdownButtonList2 = [
    'USD',
    'EUR',
    'GBP',
    'CHF',
    'TRY',
  ];

  String dropdownValue1 = 'TRY';
  String dropdownValue2 = 'USD';

  buildTextFormFieldFirstCurr(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(50), vertical: context.dynamicHeight(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('Çevrilecek Para Birimi'),
          value: dropdownValue1,
          items: dropdownButtonList1.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
            );
          }).toList(),
          selectedItemBuilder: (context) {
            return dropdownButtonList1.map((String value) {
              return Text(value, style: const TextStyle(color: Colors.black, fontSize: 18));
            }).toList();
          },
          onChanged: (value) {
            setState(() {
              dropdownValue1 = value.toString();
            });
          },
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }

  buildTextFormFieldSecondCurr(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.dynamicHeight(10), left: context.dynamicWidth(50), right: context.dynamicWidth(50)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('Dönüştürülecek Para Birimi'),
          value: dropdownValue2,
          items: dropdownButtonList2.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
            );
          }).toList(),
          selectedItemBuilder: (context) {
            return dropdownButtonList2.map((String value) {
              return Text(value, style: const TextStyle(color: Colors.black, fontSize: 18));
            }).toList();
          },
          onChanged: (value) {
            setState(() {
              dropdownValue2 = value.toString();
            });
          },
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }

  buildRegisterButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, left: context.dynamicWidth(20), right: context.dynamicWidth(20)),
      child: CustomElevationButton(
        minimumSize: Size(context.width, context.highValue),
        onPressed: () async {
          if (_registerFormKey.currentState != null && _registerFormKey.currentState!.validate()) {
            _registerFormKey.currentState!.save();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLogin', true);
            prefs.setString('fullName', _fullName.text);
            prefs.setString('email', _emailText.text);
            prefs.setString('firstCurr', dropdownValue1);
            prefs.setString('secondCurr', dropdownValue2);
            if (!mounted) return;
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
          }
        },
        title: CurrencyConstants.CONTINUE,
      ),
    );
  }
}

// ürünadı-ürünfiyatı-kur-ürünaçıklaması
