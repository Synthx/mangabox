import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'publisher_cubit.dart';
import 'publisher_state.dart';

class PublisherEditions extends StatelessWidget {
  const PublisherEditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PublisherScreenCubit, PublisherScreenState,
        List<Edition>>(
      selector: (state) => state.editions.content,
      builder: (context, editions) {
        return SliverGrid(
          gridDelegate: kDefaultGridDelegate,
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final edition = editions[index];
              return EditionCard(
                edition: edition,
              );
            },
            childCount: editions.length,
          ),
        );
      },
    );
  }
}
