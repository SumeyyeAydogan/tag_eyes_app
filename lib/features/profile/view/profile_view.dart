import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/features/currency/view/currency_view.dart';
import 'package:tag_eyes_app/features/wallet_card/view/wallet_card.dart';
import 'package:tag_eyes_app/main.dart';

import '../../../core/constants/image_manager.dart';
import '../../../core/init/theme/tag_eyes_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final mockListTitle = [
    "My Cart",
    "Theme",
    "Invite a friend",
    "Reach us",
    "Log Out",
  ];

  final List<Widget> list = [
    const WalletCard(),
    Column(
      children: const [Text("Theme")],
    ),
    Column(
      children: const [Text("Invite a friend")],
    ),
    Column(
      children: const [Text("Reach us")],
    ),
    Column(
      children: const [Text("Log Out")],
    ),
  ];

  final mockListIcon = [
    Icons.credit_card_outlined,
    Icons.mode_outlined,
    Icons.person_add_alt_outlined,
    Icons.contacts_outlined,
    Icons.logout_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: context.theme.colorScheme.primary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(color: Colors.transparent),
            ),
            _BodyBuildWidget(list: list, mockListTitle: mockListTitle, mockListIcon: mockListIcon),
          ],
        ),
      ),
    );
  }
}

class _BodyBuildWidget extends StatelessWidget {
  const _BodyBuildWidget({
    Key? key,
    required this.list,
    required this.mockListTitle,
    required this.mockListIcon,
  }) : super(key: key);

  final List<Widget> list;
  final List<String> mockListTitle;
  final List<IconData> mockListIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: context.paddingMediumVertical,
                child: CircleAvatar(
                  maxRadius: 40,
                  child: Image.asset(
                    ImageManager.instance.profilePhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            _UserTitleWidget(fullName: userModel.fullName),
            _UserTitleWidget(fullName: userModel.email),
            _UserProfileListWidgets(list: list, mockListTitle: mockListTitle, mockListIcon: mockListIcon),
          ],
        ),
      ),
    );
  }
}

class _UserProfileListWidgets extends StatefulWidget {
  const _UserProfileListWidgets({
    Key? key,
    required this.list,
    required this.mockListTitle,
    required this.mockListIcon,
  }) : super(key: key);

  final List<Widget> list;
  final List<String> mockListTitle;
  final List<IconData> mockListIcon;

  @override
  State<_UserProfileListWidgets> createState() => _UserProfileListWidgetsState();
}

class _UserProfileListWidgetsState extends State<_UserProfileListWidgets> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.mockListTitle.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddingHighHorizontal,
            child: InkWell(
              onTap: () async {
                if (index == 4) {
                  await quit(context);
                } else {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => widget.list[index],
                  );
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                color: context.theme.colorScheme.primary,
                child: Padding(
                  padding: context.paddingMediumLowVertical,
                  child: ListTile(
                    title: Text(
                      widget.mockListTitle[index],
                      style: TagEyesTheme.defaultTheme.textTheme.displaySmall,
                    ),
                    leading: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: context.paddingLow,
                        child: Icon(widget.mockListIcon[index]),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> quit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const CurrencyPage()), (route) => false);
  }
}

class _UserTitleWidget extends StatelessWidget {
  final String fullName;
  const _UserTitleWidget({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 0,
        child: Padding(
          padding: context.paddingMediumVertical,
          child: Text(
            fullName,
            style: TagEyesTheme.defaultTheme.textTheme.displayLarge,
          ),
        ));
  }
}
