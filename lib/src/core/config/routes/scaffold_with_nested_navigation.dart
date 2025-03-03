// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width < 450) {
      return ScaffoldWithNavigationBar(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    Widget titleWidget;

    if (currentIndex == 0) {
      titleWidget = Text(
        'Home',
        style: context.appTheme.typographies.heading,
      );
    } else if (currentIndex == 1) {
      titleWidget = Text(
        'Games',
        style: context.appTheme.typographies.heading,
      );
    } else if (currentIndex == 2) {
      titleWidget = Text(
        'New & Hot',
        style: context.appTheme.typographies.heading,
      );
    } else {
      titleWidget = Text(
        'Account',
        style: context.appTheme.typographies.heading,
      );
    }

    return Scaffold(
      backgroundColor: context.appTheme.colors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(
                start: Sizes.p16,
                bottom: Sizes.p16,
                top: currentIndex == 0 ? Sizes.p16 : 0,
              ),
              title: titleWidget,
            ),
            actions: [BuildActions(currentIndex: currentIndex)],
          ),
          SliverFillRemaining(
            child: body,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: context.appTheme.colors.backgroundDark,
        selectedIndex: currentIndex,
        destinations: [
          // products
          const NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              size: Sizes.p32,
            ),
            selectedIcon: Icon(
              Icons.home_filled,
              size: Sizes.p32,
            ),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.gamepad_outlined,
              size: Sizes.p32,
            ),
            selectedIcon: Icon(
              Icons.games,
              size: Sizes.p32,
            ),
            label: 'Games',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.movie_filter_outlined,
              size: Sizes.p32,
            ),
            selectedIcon: Icon(
              Icons.movie_filter,
              size: Sizes.p32,
            ),
            label: 'NewAndHot',
          ),
          NavigationDestination(
            icon: Image.asset(
              'assets/images/netflix_symbol.png',
              width: Sizes.p32,
              height: Sizes.p32,
            ),
            selectedIcon: Image.asset(
              'assets/images/netflix_symbol.png',
              width: Sizes.p32,
              height: Sizes.p32,
            ),
            label: 'Account',
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.black,
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_filled),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.gamepad_outlined),
                selectedIcon: Icon(Icons.games),
                label: Text('Games'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.movie_filter_outlined),
                selectedIcon: Icon(Icons.movie_filter),
                label: Text('NewAndHot'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.movie_filter_outlined),
                selectedIcon: Icon(Icons.movie_filter),
                label: Text('NewAndHot'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

class BuildActions extends StatelessWidget {
  const BuildActions({
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Row(
        children: [
          Visibility(
            visible: currentIndex != 1,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cast),
            ),
          ),
          Visibility(
            visible: currentIndex != 1,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: currentIndex == 3
                ? const Icon(Icons.menu)
                : const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
