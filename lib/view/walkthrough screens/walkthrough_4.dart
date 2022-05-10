import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/constants.dart';
import '../../components/themes.dart';

class WalkthroughPage4 extends StatefulWidget {
  const WalkthroughPage4({Key? key}) : super(key: key);

  @override
  State<WalkthroughPage4> createState() => _WalkthroughPage4State();
}

class _WalkthroughPage4State extends State<WalkthroughPage4>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeController;
  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ),
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 0.95,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        1,
        curve: Curves.easeOut,
      ),
    ),
  );

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedBuilder(
        animation: _animationController..forward(),
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _scale.value,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: -371 / mockUpHeight * size.height,
                    left: 109 / mockUpWidth * size.width,
                    width: 546 / mockUpWidth * size.width,
                    height: 756 / mockUpHeight * size.height,
                    child: Image.asset("assets/blob_1.png"),
                  ),
                  Positioned(
                    top: 245 / mockUpHeight * size.height,
                    left: 39.5 / mockUpWidth * size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/feedbacking.svg"),
                        SizedBox(
                          height: 25 / mockUpHeight * size.height,
                        ),
                        Text(
                          "FEEDBACKING",
                          textAlign: TextAlign.center,
                          textScaleFactor: textScale,
                          style: abangTextStyles.titleTextStyle.copyWith(
                            color: abangColors.abangWhite,
                          ),
                        ),
                        SizedBox(
                          height: 30 / mockUpHeight * size.height,
                        ),
                        SizedBox(
                          width: 296 / mockUpWidth * size.width,
                          child: Text(
                            "Raise complaints and suggestions transparent to both parties.",
                            textScaleFactor: textScale,
                            textAlign: TextAlign.center,
                            style:
                                abangTextStyles.descriptionTextStyle.copyWith(
                              color: abangColors.abangWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
