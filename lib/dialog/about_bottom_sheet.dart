import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/store/store.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutBottomSheet extends StatelessWidget {
  const AboutBottomSheet({Key? key}) : super(key: key);

  Future<void> _openBuyMeACoffee({
    required BuildContext context,
  }) async {
    final uri = Uri.parse('https://www.buymeacoffee.com/gsynthx');
    if (!await launchUrl(uri)) {
      // todo: log error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kRadiusLarge,
        left: kSafeArea,
        right: kSafeArea,
        bottom: kSpacer + context.safePaddingBottom,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kRadiusLarge),
          topRight: Radius.circular(kRadiusLarge),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 80,
            height: 80,
          ),
          const Gap(kSpacer),
          Text(
            'MangaBox',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'MangaBox sera une application de gestion pour votre collection de Manga, toujours en cours de développement, d\'autres fonctionnalités viendront au cours du temps.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(kSpacer),
          SizedBox(
            width: double.infinity,
            child: MbxButton.text(
              'Buy me a coffee',
              onTap: () => _openBuyMeACoffee(
                context: context,
              ),
            ),
          ),
          const Gap(kSpacer),
          Text(
            'Fait avec ❤️ avec Flutter',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          BlocSelector<DeviceCubit, DeviceState, String?>(
            selector: (state) => state.package?.version,
            builder: (context, version) {
              return Text(
                'Version $version',
                style: Theme.of(context).textTheme.bodySmall,
              );
            },
          ),
        ],
      ),
    );
  }
}
