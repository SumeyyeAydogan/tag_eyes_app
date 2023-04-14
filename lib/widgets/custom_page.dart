import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';

class CustomPageContainer extends StatelessWidget {
  final int flex;
  final int flex2;
  final String title;
  final double padding;
  final Widget content;
  final String? assetImage;
  final String buttonText;
  bool showCarrierAndSenderButton;
  bool isSelect1;
  bool isSelect2;
  bool showProfilePhoto;
  bool showCustomElevationButton;
  CustomPageContainer(
      {required this.flex,
      this.flex2 = 8,
      this.title = "",
      required this.padding,
      required this.content,
      this.assetImage,
      this.showCarrierAndSenderButton = false,
      this.isSelect1 = false,
      this.isSelect2 = false,
      this.showProfilePhoto = false,
      this.showCustomElevationButton = false,
      this.buttonText = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        //topBar(),
        Expanded(
            flex: flex,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: context.paddingMediumVertical,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: context.textTheme.headline1,
                            textAlign: TextAlign.start,
                          )),
                    ),
                    Expanded(flex: flex2, child: content),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
