import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';
import 'animations/fade_animation.dart';
import 'animations/slide_animation.dart';

class WarningSection extends HookConsumerWidget {
  const WarningSection({
    super.key,
    required this.text,
    this.isVisible = true,
  });

  final Widget text;
  final bool isVisible;

  @override
  Widget build(BuildContext context, ref) {
    final isClosed = useState(false);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 400),
      // reverseDuration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 100,
    );
    final animation = useAnimation(controller);

    return Visibility(
      visible: isVisible && !isClosed.value,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 800),
        intervalStart: .6,
        begin: const Offset(0, -100),
        child: FadeAnimation(
          duration: const Duration(milliseconds: 800),
          intervalStart: .7,
          child: Transform.translate(
            offset: Offset(0, -animation),
            child: AnimatedOpacity(
              opacity: 1 - (animation % 100) / 100,
              duration: const Duration(milliseconds: 100),
              child: Row(
                // mainAxisAlignment: mainSpaceBetween,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.warning,
                  ),
                  gap12,
                  text.expand(),
                  CloseButton(
                    color: AppColors.warning,
                    onPressed: () {
                      controller
                          .forward()
                          .whenCompleteOrCancel(() => isClosed.value = true);
                    },
                  )
                ],
              )
                  .pSymmetric(h: 8.w, v: 2.h)
                  .box
                  .colorScaffoldBackground(context, opacity: .8)
                  .roundedSM
                  .border(color: AppColors.warning, width: 1.2.w)
                  .make()
                  .px8()
                  .pOnly(bottom: 16.h),
            ),
          ),
        ),
      ),
    );
  }
}
