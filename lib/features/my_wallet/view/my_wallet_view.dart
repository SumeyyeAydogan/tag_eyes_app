import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/widgets/form/my_wallet_widget.dart';

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {});
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'My Wallet',
                  style: context.textTheme.headlineSmall!.copyWith(color: context.theme.colorScheme.primary, fontSize: 36),
                ),
                const SizedBox(height: 50),
                const Text("How much money do you have?"),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                    color: context.theme.colorScheme.primary,
                  ),
                  child: Padding(
                    padding: context.paddingHighVerticalAndHorizontal,
                    child: const MyWalletWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
