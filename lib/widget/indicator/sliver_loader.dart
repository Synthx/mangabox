import 'package:flutter/material.dart';
import 'package:mangabox/widget/widget.dart';

class SliverLoader extends StatelessWidget {
  const SliverLoader({Key? key}) : super(key: key);

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
