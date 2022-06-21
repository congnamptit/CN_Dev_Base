import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.titleButton,
    required this.imagePath,
    required this.color,
    required this.colorTxt,
    required this.boxShadow,
  }) : super(key: key);

  final String titleButton;
  final String imagePath;
  final Color color;
  final Color colorTxt;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        alignment: FractionalOffset.center,
        height: 49.0,
        width: 500.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              height: 25.0,
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
            Text(
              titleButton,
              style: TextStyle(
                color: colorTxt,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
