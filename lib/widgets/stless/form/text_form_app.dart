import 'package:flutter/material.dart';

class TextFromApp extends StatelessWidget {
  const TextFromApp({
    Key? key,
    this.email,
    this.icon,
    this.inputType,
    this.password,
  }) : super(key: key);

  final bool? password;
  final String? email;
  final IconData? icon;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 10.0, color: Colors.black12)
            ]),
        padding: const EdgeInsets.only(
            left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password!,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: email,
              icon: Icon(
                icon,
                color: Colors.black38,
              ),
              labelStyle: const TextStyle(
                fontSize: 15.0,
                fontFamily: 'Sans',
                letterSpacing: 0.3,
                color: Colors.black38,
                fontWeight: FontWeight.w600,
              ),
            ),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}
