import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage(
      {Key? key, this.colorBegin, this.colorEnd, required this.children})
      : super(key: key);

  final List<Widget> children;
  final Color? colorBegin;
  final Color? colorEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// Set Background image in layout (Click to open code)
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/img/loginscreenbackground.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
          /// Set gradient color in image (Click to open code)
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorBegin ?? const Color.fromRGBO(0, 0, 0, 0.2),
                colorEnd ?? const Color.fromRGBO(0, 0, 0, 0.3),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
