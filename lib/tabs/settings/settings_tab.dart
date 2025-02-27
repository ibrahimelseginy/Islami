import 'package:flutter/material.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/generated/l10n.dart';
import 'package:islami_testing/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    List<Languge> languages = [
      Languge(name: S.of(context).english, code: 'en'),
      Languge(name: S.of(context).arabic, code: 'ar'),
    ];
    return Consumer<SettingsProvider>(
      builder: (context, SettingsProvider, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).darkMode,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: settingsProvider.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    if (value) {
                      settingsProvider.changeTheme(ThemeMode.dark);
                    } else {}
                    settingsProvider.changeTheme(ThemeMode.light);
                  },
                  activeColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Theme.of(context).primaryColor,
                  // thumbColor: WidgetStateProperty.all(AppTheme.white),
                  inactiveThumbColor: AppTheme.white,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).language,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Languge>(
                      borderRadius: BorderRadius.circular(20),
                      value: languages.firstWhere(
                          (lang) => lang.code == settingsProvider.languageCode,
                          orElse: () => languages.first),
                      items: languages
                          .map(
                            (language) => DropdownMenuItem<Languge>(
                              value: language,
                              child: Text(
                                language.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (selectedLanaguage) {
                        if (selectedLanaguage != null) {
                          SettingsProvider.changeLanguageCode(
                              selectedLanaguage.code);
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Languge {
  String name;
  String code;
  Languge({
    required this.name,
    required this.code,
  });
}
