import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'publisher_cubit.dart';
import 'publisher_state.dart';

class PublisherTitle extends StatelessWidget {
  const PublisherTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          top: kTitleSpacer + context.safePaddingTop + kToolbarHeight,
          bottom: kTitleSpacer,
        ),
        child:
            BlocSelector<PublisherScreenCubit, PublisherScreenState, Publisher>(
          selector: (state) => state.publisher,
          builder: (context, publisher) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  publisher.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                if (publisher.closed)
                  Text(
                    'Cette éditeur n\'est plus en activité',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
