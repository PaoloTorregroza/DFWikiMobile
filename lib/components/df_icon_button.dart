import 'package:flutter/material.dart';

class DFIconButton extends StatefulWidget {
  const DFIconButton({Key? key}) : super(key: key);

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
        icon: const Icon(Icons.search),
        iconSize: 20,
        splashRadius: 16,
        onPressed: () {},
      ),
    );
  }
}
