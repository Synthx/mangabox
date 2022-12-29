import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'collection/collection.dart';
import 'main_app_bar.dart';
import 'main_navigation_button.dart';
import 'main_store.dart';
import 'recent/recent.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenStore(),
      child: const _MainScreenWrapper(),
    );
  }
}

class _MainScreenWrapper extends StatefulWidget {
  const _MainScreenWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _MainScreenStateWrapper();
}

class _MainScreenStateWrapper extends State<_MainScreenWrapper> {
  final _pageController = PageController();
  bool _showMenuButton = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _onScroll({
    required double position,
  }) {
    setState(() {
      _showMenuButton = position > 350;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<MainScreenStore>()
        .setPageController(pageController: _pageController);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MainScreenAppBar(),
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _showMenuButton ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _showMenuButton ? 1 : 0,
          child: const MainScreenNavigationButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) => _onScroll(
          position: notification.metrics.pixels,
        ),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            RecentBookScreen(),
            CollectionScreen(),
          ],
        ),
      ),
    );
  }
}
