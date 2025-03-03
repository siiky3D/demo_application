part of '../../pages/home/home_screen.dart';

class RankedMovieCard extends StatelessWidget {
  const RankedMovieCard({
    required this.size,
    required this.imageUrl,
    super.key,
  });

  final Size size;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final isAddedToMyFavorite = ValueNotifier<bool>(false);
    final locale = AppLocalizations.of(context);
    return Container(
      height: size.height * 0.45.h,
      width: size.width * 0.75.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
        color: context.colors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colors.border,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Sizes.p6.h,
                    left: Sizes.p6.w,
                  ),
                  width: size.width * 0.33.w,
                  child: ElevatedButton(
                    style: context.appTheme.styles.buttonLarge,
                    onPressed: () {
                      final snackBar = SnackBar(
                        backgroundColor: context.colors.primary,
                        content: Text(
                          locale.sorryThisFunctionIsNotAvailable,
                          style:
                              context.appTheme.typographies.bodyLarge.copyWith(
                            color: context.colors.textOnPrimary,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            size: Sizes.p32,
                            color: context.colors.background,
                          ),
                          gapW4,
                          Text(
                            locale.play,
                            style: context.appTheme.typographies.headingSmall
                                .copyWith(color: context.colors.background),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              gapW6,
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Sizes.p6.h,
                    right: Sizes.p6.w,
                  ),
                  width: size.width * 0.33.w,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isAddedToMyFavorite,
                    builder: (context, isAdded, child) {
                      return OutlinedButton(
                        style: context.appTheme.styles.buttonLarge,
                        onPressed: () {
                          isAddedToMyFavorite.value = !isAdded;
                        },
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isAdded ? Icons.check : Icons.add,
                                size: Sizes.p32,
                                color: context.colors.textOnPrimary,
                              ),
                              gapW4,
                              Text(
                                locale.myList,
                                style:
                                    context.appTheme.typographies.headingSmall,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
