import 'package:clean_base/src/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  static const route = 'splash-view';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  void checkInternet() async {
    await Future.delayed(const Duration(milliseconds: 1200));
  }

  _pushNextPage() {
    // final isShowed = HiveManager().getBoxItem(
    //   HiveBoxNames.userInformation,
    //   HiveBoxKeys.userShowedIntroScreen,
    // );

    // if (isShowed != null) {
    //   Navigator.pushReplacementNamed(context, HomeScreen.route);
    // } else {
    //   Navigator.pushReplacementNamed(context, IntroducingScreen.route);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: SpinKitThreeBounce(
                color: AppColors.whiteColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
