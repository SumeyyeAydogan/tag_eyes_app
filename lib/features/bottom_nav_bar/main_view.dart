import 'package:flutter/material.dart';
import 'package:tag_eyes_app/features/scanqr/view/scanqr.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const ScanQR();
  }
}




// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
//   late final TabController _tabController;
//   final double _notchedValue = 10;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: MyTabViews.values.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _myTabBarView(),
//       bottomNavigationBar: BottomAppBar(
//         color: context.theme.colorScheme.primary,
//         notchMargin: _notchedValue,
//         shape: const CircularNotchedRectangle(),
//         child: _myTabBar(),
//       ),
//     );
//   }

//   TabBar _myTabBar() {
//     return TabBar(
//       padding: EdgeInsets.zero,
//       onTap: (int index) {},
//       controller: _tabController,
//       tabs: MyTabViews.values.map((e) => Tab(icon: e.iconName)).toList(),
//     );
//   }

//   TabBarView _myTabBarView() {
//     return TabBarView(controller: _tabController, children: MyTabViews.values.map((e) => Tab(child: e.route)).toList());
//   }
// }

// enum MyTabViews { home, notifications, barcode, settings, profile }

// extension _MyTabViewsExtension on MyTabViews {
//   Icon get iconName {
//     switch (this) {
//       case MyTabViews.home:
//         return const Icon(Icons.home_outlined);
//       case MyTabViews.notifications:
//         return const Icon(Icons.notifications_outlined);
//       case MyTabViews.barcode:
//         return const Icon(Icons.camera_outlined);
//       case MyTabViews.settings:
//         return const Icon(Icons.settings_outlined);
//       case MyTabViews.profile:
//         return const Icon(Icons.person_outlined);
//       default:
//         return const Icon(Icons.add);
//     }
//   }

//   Widget get route {
//     switch (this) {
//       case MyTabViews.home:
//         return const HomePage();
//       case MyTabViews.notifications:
//         return const NotificationsPage();
//       case MyTabViews.barcode:
//         return const BarcodePage();
//       case MyTabViews.settings:
//         return const SettingsPage();
//       case MyTabViews.profile:
//         return const ProfilePage();
//       default:
//         return const HomePage();
//     }
//   }
// }
