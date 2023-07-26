import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          CircularProgressIndicator(),
          Text('Carregando'),
        ],
      ),
    );
  }
}
