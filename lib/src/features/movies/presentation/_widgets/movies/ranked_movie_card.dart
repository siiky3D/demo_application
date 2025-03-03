part of '../../pages/home/home_screen.dart';

class RankedMovieCard extends StatelessWidget {
  const RankedMovieCard({
    required this.size,
    super.key,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.45.h,
      width: size.width * 0.7.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/netflix_symbol.png'),
          fit: BoxFit.contain,
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
                    onPressed: () {},
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
                            'เล่น',
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
                  child: OutlinedButton(
                    style: context.appTheme.styles.buttonLarge,
                    onPressed: () {},
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: Sizes.p32,
                            color: context.colors.textOnPrimary,
                          ),
                          gapW4,
                          Text(
                            'รายการของฉัน',
                            style: context.appTheme.typographies.headingSmall,
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
            ],
          ),
        ],
      ),
    );
  }
}
