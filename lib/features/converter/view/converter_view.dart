import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/core/init/theme/tag_eyes_theme.dart' as theme;
import 'package:http/http.dart' as http;
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

bool _isLoading = false;

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {});
      },
      child: Scaffold(
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
                        onTap: () {
                          curr1.clear();
                        },
                        keyboardType: TextInputType.number,
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
                      child: Center(child: Text(curr2.text, style: const TextStyle(fontSize: 20))),
                    ),
                  ],
                ),
                Center(
                  child: OutlinedButton(
                    onPressed: () async {
                      _convertCurrency();
                    },
                    child: (() {
                      if (_isLoading) {
                        return const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        );
                      } else {
                        return const Text('Dönüştür', style: TextStyle(fontSize: 20, color: Colors.black));
                      }
                    }()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _convertCurrency() async {
    setState(() {
      _isLoading = true;
    });
    dynamic response;
    try {
      String url = 'https://api.apilayer.com/currency_data/live?base=$_dropdownValue2&symbols=USD,EUR,GBP,CHF,TRY';
      response = await http.get(Uri.parse(url), headers: {'apikey': 'sALCEiepANS3N9qLpmQBXZugJSxE3itM'});
    } on Exception catch (e) {
      debugPrint('Exception: $e');
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (_dropdownValue1 == 'USD') {
        if (data['success']) {
          double conversionRate = data['quotes']['$_dropdownValue1$_dropdownValue2'];
          double inputValue = double.parse(curr1.text);
          setState(() {
            curr2.text = (inputValue * conversionRate).toStringAsFixed(2);
            _isLoading = false;
          });
        }
      } else {
        double conversionRate1;
        if (data['success']) {
          if (_dropdownValue2 == 'USD') {
            conversionRate1 = 1;
          } else {
            conversionRate1 = data['quotes']['USD$_dropdownValue2'];
          }
          double conversionRate2 = data['quotes']['USD$_dropdownValue1'];
          double conversionRate = conversionRate2 / conversionRate1;
          double inputValue = double.parse(curr1.text);
          setState(() {
            curr2.text = (inputValue / conversionRate).toStringAsFixed(2);
            _isLoading = false;
          });
        }
      }
    }
  }
}
