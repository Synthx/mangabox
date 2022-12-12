import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/widget/widget.dart';

import 'edition_cubit.dart';
import 'edition_state.dart';

class EditionScreenHeader extends StatelessWidget {
  const EditionScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocSelector<EditionScreenCubit, EditionScreenState, Edition>(
        selector: (state) => state.edition,
        builder: (context, edition) {
          return PictureHeader(
            picture: edition.picture,
            child: MbxBadges(
              badges: [
                edition.status.locale(),
                edition.publisher.name,
                edition.series.type.name,
              ],
            ),
          );
        },
      ),
    );
  }
}
