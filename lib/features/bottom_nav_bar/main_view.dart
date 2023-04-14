import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';
import 'package:tag_eyes_app/features/notifications/view/notifications_view.dart';
import '../barcode/view/barcode_view.dart';
import '../home/view/home_view.dart';
import '../profile/view/profile_view.dart';
import '../settings/view/settings_view.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
      body: _myTabBarView(),
      /* floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('+', style: Theme.of(context).textTheme.headline1)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, */
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
        //labelColor: Colors.black,
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: MyTabViews.values.map((e) => Tab(icon: e.iconName)).toList());
  }

  TabBarView _myTabBarView() {
    return TabBarView(
        controller: _tabController,
        children: MyTabViews.values.map((e) => Tab(child: e.route)).toList());
  }
}

enum MyTabViews { home, notifications, barcode, settings, profile }

extension _MyTabViewsExtension on MyTabViews {
  Icon get iconName {
    switch (this) {
      case MyTabViews.home:
        return const Icon(Icons.home_outlined);
      case MyTabViews.notifications:
        return const Icon(Icons.notifications_outlined);
      case MyTabViews.barcode:
        return const Icon(Icons.camera_outlined);
      case MyTabViews.settings:
        return const Icon(Icons.settings_outlined);
      case MyTabViews.profile:
        return const Icon(Icons.person_outlined);
      default:
        return const Icon(Icons.add);
    }
  }

  Widget get route {
    switch (this) {
      case MyTabViews.home:
        return const HomePage();
      case MyTabViews.notifications:
        return const NotificationsPage();
      case MyTabViews.barcode:
        return const BarcodePage();
      case MyTabViews.settings:
        return const SettingsPage();
      case MyTabViews.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}





/* class BottomPage extends StatelessWidget {
  BottomPage({Key? key}) : super(key: key);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home)),
    BottomNavigationBarItem(icon: Icon(Icons.person)),
    BottomNavigationBarItem(icon: Icon(Icons.add_box)),
    BottomNavigationBarItem(icon: Icon(Icons.search)),
    BottomNavigationBarItem(icon: Icon(Icons.settings)),
  ];
  List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    AddPostPage(),
    SearchPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      items: items,
      onTap: (value) => pages,
    ));
  }
} */




 /* 
 
 final photoList = [
    "assets/images/page1.png",
    "assets/images/page2.png",
    "assets/images/page3.png",
    "assets/images/page4.png",
  ];
 **********************************
 
  CarouselSlider buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true, autoPlay: true, viewportFraction: 1),
      items: photoList.map<Widget>((index) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              index.toString(),
            );
          },
        );
      }).toList(),
    );
  }
} */