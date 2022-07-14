import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Expanded(child: Container()),
        SizedBox(
          height: 100,
          child: Image.asset("assets/loading.gif"),
        ),
        const Text("Loading..."),
        const SizedBox(height: 25,)
      ],
    );
  }
}
