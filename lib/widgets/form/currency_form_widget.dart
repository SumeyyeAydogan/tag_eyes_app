import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/core/constants/application_constants.dart';
import 'package:tag_eyes_app/core/constants/register_constants.dart';
import 'package:tag_eyes_app/features/bottom_nav_bar/main_view.dart';
import 'package:tag_eyes_app/main.dart';
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
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;
  File? _imageFile;

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
    // if (_imageFile == null) {
    //   return Center(
    //     child: GestureDetector(
    //       onTap: () async {
    //         await getImage();
    //       },
    //       child: Container(
    //         height: context.dynamicHeight(50),
    //         width: context.dynamicWidth(200),
    //         decoration: BoxDecoration(
    //           color: Colors.grey,
    //           borderRadius: BorderRadius.circular(50),
    //         ),
    //         child: Icon(
    //           Icons.add_a_photo,
    //           size: context.dynamicWidth(30),
    //         ),
    //       ),
    //     ),
    //   );
    // } else {
    //   return SizedBox(
    //     height: context.dynamicHeight(150),
    //     child: Image.file(_imageFile!),
    //   );
    // }
    // _imageFile == null
    //     ? Center(
    //         child: GestureDetector(
    //           onTap: () async {
    //             await getImage();
    //           },
    //           child: Container(
    //             height: 50,
    //             width: 200,
    //             decoration: BoxDecoration(
    //               color: Colors.grey,
    //               borderRadius: BorderRadius.circular(50),
    //             ),
    //             child: const Icon(
    //               Icons.add_a_photo,
    //               size: 30,
    //             ),
    //           ),
    //         ),
    //       )
    //     : SizedBox(
    //         height: 200,
    //         child: Image.file(_imageFile!),
    //       );
    // (() {
    //   bool? isImageSelected = prefs?.getBool('isImageSelected');
    //   if (isImageSelected == null || isImageSelected == false) {
    //     return Center(
    //       child: GestureDetector(
    //         onTap: () async {
    //           await getImage();
    //         },
    //         child: Container(
    //           height: 50,
    //           width: 200,
    //           decoration: BoxDecoration(
    //             color: Colors.grey,
    //             borderRadius: BorderRadius.circular(50),
    //           ),
    //           child: const Icon(
    //             Icons.add_a_photo,
    //             size: 30,
    //           ),
    //         ),
    //       ),
    //     );
    //   } else {
    //     String? imagePath = prefs?.getString('imagePath');
    //     return Center(
    //       child: GestureDetector(
    //         onTap: () async {
    //           await getImage();
    //         },
    //         child: Container(
    //           height: 50,
    //           width: 200,
    //           decoration: BoxDecoration(
    //             color: Colors.grey,
    //             borderRadius: BorderRadius.circular(50),
    //           ),
    //           child: Image.file(
    //             File(imagePath!),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //     );
    //   }
    // })();
  }

  Future getImage() async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    String? path;
    await getApplicationDocumentsDirectory().then((value) {
      path = value.path;
    });
    await _pickedFile?.saveTo('$path/currentUserImage.jpg');
    debugPrint('saved path:$path/currentUserImage.jpg');
    prefs?.setBool('isImageSelected', true);
    prefs?.setString('userImagePath', '$path/currentUserImage');
    setState(() {
      if (_pickedFile != null) {
        setState(() {
          _imageFile = File(_pickedFile!.path);
        });
      } else {
        debugPrint('No image selected.');
      }
    });
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