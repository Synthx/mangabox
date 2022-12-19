import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'author_cubit.dart';
import 'author_state.dart';

class AuthorScreenTitle extends StatelessWidget {
  const AuthorScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          top: kTitleSpacer + context.safePaddingTop + kToolbarHeight,
          bottom: kTitleSpacer,
        ),
        child: BlocSelector<AuthorScreenCubit, AuthorScreenState, Author>(
          selector: (state) => state.author,
          builder: (context, author) {
            return Text(
              author.name,
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
    );
  }
}
