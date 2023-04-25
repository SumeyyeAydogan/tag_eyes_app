import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/features/scanqr/view/scanqr.dart';

import '../converter/view/converter_view.dart';
import '../home/view/home_view.dart';
import '../my_wallet/view/my_wallet_view.dart';
import '../profile/view/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myTabBarView(),
      bottomNavigationBar: BottomAppBar(
        color: context.theme.colorScheme.primary,
        notchMargin: _notchedValue,
        shape: const CircularNotchedRectangle(),
        child: _myTabBar(),
      ),
    );
  }

  TabBar _myTabBar() {
    return TabBar(
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      controller: _tabController,
      tabs: MyTabViews.values.map((e) => Tab(icon: e.iconName)).toList(),
    );
  }

  TabBarView _myTabBarView() {
    return TabBarView(
        controller: _tabController,
        children: MyTabViews.values.map((e) => Tab(child: e.route)).toList());
  }
}

enum MyTabViews { home, converter, barcode, myPurse, profile }

extension _MyTabViewsExtension on MyTabViews {
  Icon get iconName {
    switch (this) {
      case MyTabViews.home:
        return const Icon(Icons.home_outlined);
      case MyTabViews.converter:
        return const Icon(Icons.calculate_outlined);
      case MyTabViews.barcode:
        return const Icon(Icons.camera_outlined);
      case MyTabViews.myPurse:
        return const Icon(Icons.wallet_outlined);
      case MyTabViews.profile:
        return const Icon(Icons.person_outlined);
      default:
        return const Icon(Icons.camera_outlined);
    }
  }

  Widget get route {
    switch (this) {
      case MyTabViews.home:
        return const HomePage();
      case MyTabViews.converter:
        return const ConverterPage();
      case MyTabViews.barcode:
        return const ScanQR();
      case MyTabViews.myPurse:
        return const MyWalletPage();
      case MyTabViews.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}


/* import 'package:flutter/material.dart';
import 'package:tag_eyes_app/features/profile/view/profile_view.dart';
import 'package:tag_eyes_app/features/scanqr/view/scanqr.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person, color: Colors.yellow, size: 32),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        ),
        title: const Text('TagEyes', style: TextStyle(color: Colors.yellow, fontSize: 24)),
        backgroundColor: Colors.transparent,
      ),
      body: const ScanQR(),
    );
  }
}
 */