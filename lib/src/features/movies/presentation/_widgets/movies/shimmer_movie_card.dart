// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../pages/home/home_screen.dart';

class ShimmerMovieCard extends StatelessWidget {
  const ShimmerMovieCard({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Shimmer.fromColors(
      baseColor: AppColors.darkGray,
      highlightColor: AppColors.gray,
      child: Container(
        width: width ?? size.width * 0.25.w,
        height: height ?? size.height * 0.15.h,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
