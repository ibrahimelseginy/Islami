import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> doaa = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  height: 100,
                  image: AssetImage(
                      'assets/images/${settingsProvider.ImageName_Head_Sebha}.png'),
                ),
              ),
            ),
            InkWell(
              onTap: counterMethod,
              child: Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Align(
                  child:
                      // AnimatedRotation(
                      //   turns: angle,
                      //   duration: Duration(minutes: 8),
                      //   curve: Curves.linear,
                      Transform.rotate(
                    angle: angle,
                    child: Image(
                      alignment: Alignment.center,
                      image: AssetImage(
                        'assets/images/${settingsProvider.ImageName_Body_Sebha}.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor),
          child: Text(
            counter.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).brightness == Brightness.light
                ? AppTheme.primaryLight
                : AppTheme.gold,
          ),
          child: Text(doaa[index],
              style: GoogleFonts.amiri(
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppTheme.white
                      : AppTheme.black,
                ),
              )),
        )
      ],
    );
  }

  counterMethod() {
    angle += 10;
    if (counter == 33) {
      counter = 0;
      if (index < doaa.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      counter++;
    }
    setState(() {});
  }
}
