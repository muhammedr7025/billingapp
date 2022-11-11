import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String? name;
  const EmptyView({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no $name'),
      ],
    );
  }
}
