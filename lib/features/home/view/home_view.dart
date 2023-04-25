import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:tag_eyes_app/core/constants/image_manager.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';

import '../../../widgets/place_card.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final photoList = [
    ImageManager.instance.turkishDelight,
    ImageManager.instance.turkishBaklava,
    ImageManager.instance.turkishCottonCandy,
    ImageManager.instance.turkishColdBaklava,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: context.height * 0.05),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: TopBarMenu()),
            Padding(
              padding: EdgeInsets.zero,
              child: buildSlider(),
            ),
            SizedBox(height: context.height * 0.05),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Nearby Places',
                  style: Theme.of(context).textTheme.headline1),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const PlaceCard(),
                        SizedBox(height: context.height * 0.01),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

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
}

class TopBarMenu extends StatefulWidget {
  const TopBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBarMenu> createState() => _TopBarMenuState();
}

class _TopBarMenuState extends State<TopBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(ImageManager.instance.profilePhoto),
      SizedBox(width: context.width * 0.01),
      Row(
        children: [
          RichText(
            text: const TextSpan(
              text: 'Hello\n',
              style: TextStyle(color: Colors.grey),
              children: <TextSpan>[
                TextSpan(
                    text: 'Sümeyye Aydoğan',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
      const Spacer(),
    ]);
  }
}
