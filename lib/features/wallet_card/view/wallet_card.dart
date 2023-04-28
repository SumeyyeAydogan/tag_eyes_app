import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/constants/image_manager.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';

import 'package:tag_eyes_app/core/constants/image_manager.dart';
import 'package:tag_eyes_app/main.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  final moneyIconList = [
    ImageManager.instance.turkishLiraIcon,
    ImageManager.instance.dollarIcon,
    ImageManager.instance.euroIcon,
    ImageManager.instance.poundIcon,
  ];

  final currencyList = [
    "Turkish Lira",
    "Dollar",
    "Euro",
    "Pound",
  ];

  final moneyAmountList = [
    prefs!.getString('TRY').toString(),
    prefs!.getString('USD').toString(),
    prefs!.getString('EUR').toString(),
    prefs!.getString('GBP').toString(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHighVertical,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: currencyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddingHighHorizontal,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: context.theme.colorScheme.primary,
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListTile(
                  leading: Image.asset(height: 35, width: 35, moneyIconList[index]),
                  trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        moneyAmountList[index],
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  title: Text(currencyList[index], style: Theme.of(context).textTheme.displayMedium),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
