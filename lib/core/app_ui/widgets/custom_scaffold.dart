import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'animations/animations.dart';

class CustomScaffold extends HookWidget {
  const CustomScaffold({
    Key? key,
    this.appBar,
    this.body,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: 200.milliseconds,
      reverseDuration: 200.milliseconds,
    );
    final tweenAnim = Tween<double>(begin: 0, end: 1);
    final animation = tweenAnim.animate(animationController);
    final hookAnimation = useAnimation(animation);

    useEffect(() {
      Future.microtask(() => animationController.forward());
      return null;
    }, []);

    return WillPopScope(
      onWillPop: () async {
        await Future.microtask(() => animationController.reverse());
        return Future(() => true);
      },
      child: FadeAnimation(
        intervalStart: 0.5,
        duration: const Duration(milliseconds: 200),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appBar,
          body: SafeArea(
            top: false,
            child: AnimatedBuilder(
                animation: animation,
                child: body,
                builder: (context, child) {
                  return SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: .18.sh,
                          child: Transform.translate(
                            offset: Offset(0, (hookAnimation - 1) * .18.sh),
                            child: VxArc(
                              height: hookAnimation * .06.sh,
                              child: Container(
                                height: hookAnimation * .18.sh,
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: SizedBox(
                            height: 1.sh,
                            width: 1.sw,
                            child: child,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
