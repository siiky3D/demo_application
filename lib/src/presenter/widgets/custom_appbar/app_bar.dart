import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/core/utils/size.dart';

class AppAppBar extends AppBar {
  AppAppBar({
    super.key,
    super.title,
    super.foregroundColor,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          leading: leading ?? const AppBarBackButton(),
          actions: <Widget>[
            if (trailing != null)
              AppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
        );
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 28);
}

class AppExpandableSliverAppBar extends SliverAppBar {
  AppExpandableSliverAppBar({
    super.floating = true,
    super.pinned = true,
    super.primary = true,
    super.shape = const RoundedRectangleBorder(borderRadius: _borderRadius),
    super.actions,
    super.automaticallyImplyLeading,
    super.backgroundColor,
    super.bottom,
    super.centerTitle,
    super.collapsedHeight,
    super.elevation,
    super.excludeHeaderSemantics,
    super.iconTheme,
    super.actionsIconTheme,
    super.forceElevated,
    super.key,
    super.leading,
    super.shadowColor,
    super.snap,
    super.stretch,
    super.toolbarHeight,
    super.toolbarTextStyle,
    super.clipBehavior,
    super.forceMaterialTransparency,
    super.foregroundColor,
    super.leadingWidth,
    super.onStretchTrigger,
    super.scrolledUnderElevation,
    super.stretchTriggerOffset,
    super.surfaceTintColor,
    super.systemOverlayStyle,
    Widget title = const SizedBox.shrink(),
    PreferredSizeWidget? background,
  }) : super(
          expandedHeight: background?.preferredSize.height,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: title,
            titlePadding: const EdgeInsets.symmetric(vertical: 16),
            background: ClipRRect(
              borderRadius: _borderRadius,
              child: background,
            ),
          ),
        );
  static const BorderRadius _borderRadius =
      BorderRadius.vertical(bottom: Radius.circular(30));
}

class AppMovingTitleSliverAppBar extends SliverAppBar {
  AppMovingTitleSliverAppBar({
    super.key,
    String title = 'Pokedex',
    double height = kToolbarHeight + 48,
    double expandedFontSize = 30,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          expandedHeight: height,
          pinned: true,
          backgroundColor: Colors.transparent,
          leading: leading ?? const AppBarBackButton(),
          actions: [
            if (trailing != null)
              AppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final safeAreaTop = MediaQuery.paddingOf(context).top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent =
                  (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              final fontSize = _textStyle.fontSize ?? 16;
              final currentTextStyle = _textStyle.copyWith(
                fontSize: fontSize + (expandedFontSize - fontSize) * percent,
              );

              final textWidth =
                  getTextSize(context, title, currentTextStyle).width;
              final startX = AppAppBar.padding.left;
              final endX =
                  MediaQuery.sizeOf(context).width / 2 - textWidth / 2 - startX;
              final dx = startX + endX - endX * percent;

              return ColoredBox(
                color: context.appTheme.colors.background
                    .withOpacity(0.8 - percent * 0.8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        offset:
                            Offset(dx, constraints.maxHeight - kToolbarHeight),
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
  static const TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    required this.icon,
    super.key,
    this.onPressed,
  });
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: AppAppBar.padding,
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    this.icon = const Icon(Icons.arrow_back_rounded),
    this.onPressed,
  });
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (!context.canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      padding: AppAppBar.padding,
      onPressed: () => onPressed ?? context.pop(),
      icon: icon,
    );
  }
}
