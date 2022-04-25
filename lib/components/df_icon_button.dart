import 'package:flutter/material.dart';

class DFIconButton extends StatefulWidget {
  const DFIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final Icon icon;
  final void Function() onPressed;

  @override
  State<DFIconButton> createState() => _DFIconButtonState();
}

class _DFIconButtonState extends State<DFIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: widget.icon,
        iconSize: 20,
        splashRadius: 16,
        onPressed: widget.onPressed,
      ),
    );
  }
}
