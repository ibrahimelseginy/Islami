import 'package:flutter/material.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/models/hadeth_model.dart';
import 'package:islami_testing/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HadeethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  const HadeethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppTheme.white
            : AppTheme.primaryDark,
        image: DecorationImage(
            image: AssetImage(
                'assets/images/${settingsProvider.backgroundImageName}.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.width * 0.03,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).brightness == Brightness.light
                ? AppTheme.white
                : AppTheme.primaryDark,
          ),
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemBuilder: (context, index) => Text(
              hadeth.content[index],
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            itemCount: hadeth.content.length,
          ),
        ),
      ),
    );
  }
}
