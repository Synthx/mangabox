import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/store/store.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class CollectionScreenList extends StatelessWidget {
  const CollectionScreenList({Key? key}) : super(key: key);

  void _openEditionScreen({
    required BuildContext context,
    required Edition edition,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditionScreen(edition: edition),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CollectionStore, CollectionState, List<Edition>>(
      selector: (state) => state.editions.content,
      builder: (context, editions) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(
              bottom: kSpacer,
            ),
            child: EditionTile(
              edition: editions[index],
              onTap: () => _openEditionScreen(
                context: context,
                edition: editions[index],
              ),
            ),
          ),
          childCount: editions.length,
        ),
      ),
    );
  }
}
