import 'package:flutter/material.dart';

class MbxLoader extends StatelessWidget {
  const MbxLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class SliverMbxLoader extends StatelessWidget {
  const SliverMbxLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: Center(
          child: MbxLoader(),
        ),
      ),
    );
  }
}
