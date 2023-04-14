import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/features/bottom_nav_bar/main_view.dart';

import '../../core/constants/application_constants.dart';
import '../../core/constants/register_constants.dart';
import '../button/custom_elevated_button.dart';
import '../input/custom_form_input.dart';
import '../input/login_form_input.dart';

class CurrencyFormWidget extends StatelessWidget {
  CurrencyFormWidget({Key? key}) : super(key: key);

  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _emailText = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();

  final TextEditingController _passwordText = TextEditingController();

  final TextEditingController _passwordTextRepeat = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          buildTextFormFieldPerson(context),
          buildTextFormFieldEmail(context),
          buildTextFormFieldPhone(context),
          buildTextFormFieldPhone(context),
          buildRegisterButton(context),
        ],
      ),
    );
  }

  buildTextFormFieldPerson(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        title: "Currency",//CurrencyConstants.FULL_NAME,
        controller: _fullName,
        onSaved: (value) {
          _fullName.text = value!;
        },
        validator: FormBuilderValidators.required(
            errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldEmail(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        controller: _emailText,
        title: "Currency",
        onSaved: (value) {
          _emailText.text = value!;
        },
        validator: FormBuilderValidators.required(
            errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldPhone(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginInputFormField(
        title: "Currency",
        controller: _phoneNumber,
        onSaved: (value) {
          _phoneNumber.text = value!;
        },
        validator: FormBuilderValidators.required(
            errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldPassword(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginPasswordCustomField(
        controller: _passwordText,
        title: "Currency",
        onSaved: (value) {
          _passwordText.text = value!;
        },
        validator: FormBuilderValidators.required(
            errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }

  buildTextFormFieldPasswordAgain(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: LoginPasswordCustomField(
        controller: _passwordTextRepeat,
        title: "Currency",
        onSaved: (value) {
          _passwordText.text = value!;
        },
        validator: FormBuilderValidators.required(
            errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
      ),
    );
  }
 

  buildRegisterButton(BuildContext context) {
    return Padding(
      padding: context.paddingHighVertical,
      child: CustomElevationButton(
        //primaryColor: context.theme.colorScheme.primary,
        minimumSize: Size(context.width, context.highValue),
        onPressed: () async {
          if (_registerFormKey.currentState != null &&
              _registerFormKey.currentState!.validate()) {
            _registerFormKey.currentState!.save();
            await /* RegisterRequestModel(
                id: "id",
                email: _emailText.text,
                password: _passwordText.text,
                fullName: _fullName.text,
                gainTotalNumber: 0,
                identityBirthDay: "identityBirthDay",
                identityFirstName: "identityFirstName",
                identityLastName: "identityLastName",
                identityNumber: "identityNumber",
                isIdentity: "isIdentity",
                phone: _phoneNumber.text,
                phoneAuth: false,
                profileImage: "profileImage",
                senderTotalNumber: 0,
                transportTotalNumber: 0); */
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MainPage()));
          }
        },
        title: CurrencyConstants.REGISTER,
      ),
    );
  }
}
