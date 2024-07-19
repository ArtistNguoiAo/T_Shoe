import 'package:e_medicine/core/route/app_route.dart';
import 'package:e_medicine/core/utils/media_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: SvgPicture.asset(
                  MediaUtils.imgLogo,
                  width: 160,
                  height: 160,
                ).animate().addEffect(
                  SlideEffect(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                    duration: 1.seconds,
                    curve: Curves.easeInOut,
                  ),
                ).then().addEffect(
                    const ShakeEffect(
                      duration: Duration(seconds: 1),
                      hz: 4,
                      curve: Curves.easeInOut,
                    )
                )
            ),
          ),
          Text(
            TextUtils.author,
            style: TextStyleUtils.textStyleMuseoS16W400Black
          ).animate().addEffect(
            const FadeEffect(
              duration: Duration(seconds: 2),
              begin: 0.0,
              end: 1.0,
            )
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
