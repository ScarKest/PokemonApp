import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        SizedBox(
          height: 100,
          child: Image.asset("assets/loading.gif"),
        ),
        const Text("Loading...")
      ],
    );
  }
}
