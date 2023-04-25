import 'package:flutter/material.dart';
import 'package:tag_eyes_app/core/extension/context_extension.dart';

class CustomElevationButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String title;
  final bool isCircle;
  final Color? primaryColor;
  final Size? minimumSize;
  const CustomElevationButton({Key? key, required this.onPressed, required this.title, this.isCircle = false, this.primaryColor, this.minimumSize}) : super(key: key);

  @override
  State<CustomElevationButton> createState() => _CustomElevationButtonState();
}

class _CustomElevationButtonState extends State<CustomElevationButton> {
  Future<void> _completeProcess() async {
    await widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _completeProcess,
      style: ElevatedButton.styleFrom(
        minimumSize: widget.minimumSize,
        backgroundColor: Colors.white70,//context.theme.colorScheme.secondary,
        shape: widget.isCircle ? const CircleBorder(side: BorderSide.none) : null,
      ),
      child: Text(widget.title, style: context.textTheme.labelLarge),
    );
  }
}
