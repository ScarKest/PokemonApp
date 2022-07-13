import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  TextStyle titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
  TextStyle textStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 100, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 140),
            Text("Something went wrong", style: titleStyle),
            const SizedBox(height: 20),
            Text("please try again later...", style: textStyle),
            const SizedBox(height: 100),
            tryAgainButton()
          ],
        ),
      ),
      bottomSheet: Image.asset("assets/pikachu.png"),
    );
  }
}

Widget tryAgainButton() {
  return Center(
    child: GestureDetector(
      //TODO: ingresar el metodo
      onTap: () {
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Text(
            "Try Again Now",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    ),
  );
}
