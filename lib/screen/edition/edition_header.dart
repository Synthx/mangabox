import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'edition_cubit.dart';
import 'edition_header_button.dart';
import 'edition_state.dart';

class EditionScreenHeader extends StatelessWidget {
  const EditionScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionScreenCubit, EditionScreenState, Edition>(
      selector: (state) => state.edition,
      builder: (context, edition) {
        return SliverPictureHeader(
          picture: edition.picture,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MbxBadges(
                badges: [
                  edition.status.locale(),
                  edition.publisher.name,
                  edition.series.type.name,
                ],
              ),
              const Gap(kSpacer),
              const EditionScreenHeaderButton(),
            ],
          ),
        );
      },
    );
  }
}
