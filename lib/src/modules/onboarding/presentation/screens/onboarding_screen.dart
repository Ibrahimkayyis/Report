import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/onboarding/presentation/cubits/onboarding_cubit.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(AssetGenImage asset, {double height = 300}) {
    return Center(
      child: asset.image(height: height.h, fit: BoxFit.contain),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context); // ⬅️ Sama seperti LoginScreen

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyTextStyle: TextStyle(fontSize: 16, color: Colors.black54),
      pageColor: Colors.white,
      contentMargin: EdgeInsets.symmetric(horizontal: 16),
      bodyFlex: 3,
      imageFlex: 4,
    );

    final pages = [
      PageViewModel(
        title: t.app.onboarding.page1.title,
        body: t.app.onboarding.page1.body,
        image: _buildImage(Assets.images.onbGeneral),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: t.app.onboarding.page2.title,
        body: t.app.onboarding.page2.body,
        image: _buildImage(Assets.images.onbTeknisi),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: t.app.onboarding.page3.title,
        body: t.app.onboarding.page3.body,
        image: _buildImage(Assets.images.onbChat),
        decoration: pageDecoration,
      ),
    ];

    return BlocProvider(
      create: (_) => sl<OnboardingCubit>(),
      child: Builder(
        builder: (context) {
          void onDone() {
            context.read<OnboardingCubit>().finishOnboarding();
            context.router.replaceAll([const RegisterRoute()]);
          }

          return IntroductionScreen(
            key: introKey,
            pages: pages,
            globalBackgroundColor: Colors.white,
            showSkipButton: true,
            skip: Text(
              t.app.onboarding.skip,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            next: const Icon(Icons.arrow_forward),
            done: Text(
              t.app.onboarding.start,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            onDone: onDone,
            onSkip: onDone,
            dotsDecorator: DotsDecorator(
              size: const Size(8, 8),
              color: Colors.grey,
              activeSize: const Size(22, 10),
              activeColor: ColorName.primary,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
      ),
    );
  }
}
