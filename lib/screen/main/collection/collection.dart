import 'package:flutter/material.dart';

import 'collection_list.dart';
import 'collection_title.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CollectionScreenTitle(),
          CollectionScreenList(),
        ],
      ),
    );
  }
}
