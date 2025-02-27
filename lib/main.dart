import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/generated/l10n.dart';
import 'package:islami_testing/screens/home_screen.dart';
import 'package:islami_testing/screens/hadeeth_details_screen.dart';
import 'package:islami_testing/screens/sura_details_screen.dart';
import 'package:islami_testing/provider/settings_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var settingsProvider = SettingsProvider();
  await settingsProvider.loadThemeMode();
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const Islami()));
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return
        //  ChangeNotifierProvider(
        // create: (context) => SettingsProvider(),
        // child: Builder(
        //   builder: (ctx) =>
        MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen(),
        HadeethDetailsScreen.routeName: (_) => const HadeethDetailsScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
      initialRoute: HomeScreen.routeName,
    );
    // ),
    //   ),
    // );
  }
}
