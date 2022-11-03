import 'package:flutter/material.dart';

class IntroducingScreen extends StatefulWidget {
  static const route = 'intro-screen';

  const IntroducingScreen({Key? key}) : super(key: key);

  @override
  State<IntroducingScreen> createState() => _IntroducingScreenState();
}

class _IntroducingScreenState extends State<IntroducingScreen> {
  int step = 0;

  void _goToHome() {
    // Navigator.pushReplacementNamed(context, HomeScreen.route);
  }

  void _nextStep() {
    setState(() {
      if (step == 2) {
        _goToHome();
      } else {
        step++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: _goToHome,
              icon: const Icon(Icons.close),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                SizedBox(
                  width: size.width * 0.5 - 24,
                  child: ElevatedButton(
                    onPressed: _nextStep,
                    child: Text(step != 2 ? 'بعدی' : 'شروع'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
