import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final String txt;

  const ButtonLogin({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Container(
              width: 300.0,
              height: 52.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Center(
                child: Text(
                  txt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
