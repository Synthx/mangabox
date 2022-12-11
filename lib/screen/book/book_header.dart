import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenHeader extends StatelessWidget {
  const BookScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550 + context.safePaddingTop,
      child: BlocSelector<BookScreenCubit, BookScreenState, String?>(
        selector: (state) => state.book.picture,
        builder: (context, picture) {
          return Picture(
            picture: picture,
            radius: kRadiusLarge,
          );
        },
      ),
    );
  }
}
