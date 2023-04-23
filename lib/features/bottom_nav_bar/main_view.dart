import 'package:flutter/material.dart';
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
