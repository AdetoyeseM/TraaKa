import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:traacka/views/widgets/components/colors/colors.dart';

class ShimmeringContainer extends StatelessWidget {
  const ShimmeringContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.appGreen.withOpacity(.2),
      highlightColor: AppColors.appGreen,
      period: const Duration(seconds: 10),
      child: AnimatedContainer(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        height: 10,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}