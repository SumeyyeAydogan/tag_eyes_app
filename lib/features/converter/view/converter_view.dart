import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/core/init/theme/tag_eyes_theme.dart' as theme;
import 'package:tag_eyes_app/widgets/input/login_form_input.dart';

String _dropdownValue1 = 'TRY';
String _dropdownValue2 = 'USD';
TextEditingController curr1 = TextEditingController(text: '0');
TextEditingController curr2 = TextEditingController(text: '0');
List<String> _dropdownButtonList1 = [
  'USD',
  'EUR',
  'GBP',
  'CHF',
  'TRY',
];
List<String> _dropdownButtonList2 = [
  'USD',
  'EUR',
  'GBP',
  'CHF',
  'TRY',
];

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: theme.TagEyesTheme.defaultTheme.colorScheme.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(50), vertical: context.dynamicHeight(10)),
                child: const Text('Çevrilecek Para Birimi', style: TextStyle(fontSize: 20)),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: context.dynamicHeight(10), left: context.dynamicWidth(30), right: 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text('Çevrilecek Para Birimi'),
                        value: _dropdownValue1,
                        items: _dropdownButtonList1.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
                          );
                        }).toList(),
                        selectedItemBuilder: (context) {
                          return _dropdownButtonList1.map((String value) {
                            return Text(value, style: const TextStyle(color: Colors.black, fontSize: 18));
                          }).toList();
                        },
                        onChanged: (value) {
                          setState(() {
                            _dropdownValue1 = value.toString();
                          });
                        },
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: LoginInputFormField(
                      controller: curr1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(50), vertical: context.dynamicHeight(10)),
                child: const Text('Dönüştürülecek Para Birimi', style: TextStyle(fontSize: 20)),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: context.dynamicHeight(10), left: context.dynamicWidth(30), right: 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text('Dönüştürülecek Para Birimi'),
                        value: _dropdownValue2,
                        items: _dropdownButtonList2.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
                          );
                        }).toList(),
                        selectedItemBuilder: (context) {
                          return _dropdownButtonList2.map((String value) {
                            return Text(value, style: const TextStyle(color: Colors.black, fontSize: 18));
                          }).toList();
                        },
                        onChanged: (value) {
                          setState(() {
                            _dropdownValue2 = value.toString();
                          });
                        },
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: LoginInputFormField(
                      controller: curr2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
