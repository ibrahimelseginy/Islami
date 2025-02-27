import 'package:flutter/material.dart';
import 'package:islami_testing/generated/l10n.dart';
import 'package:islami_testing/tabs/hadeth/hadeeth_tab.dart';
import 'package:islami_testing/tabs/quran/quran_tab.dart';
import 'package:islami_testing/tabs/radio/radio_tab.dart';
import 'package:islami_testing/tabs/sebha/sebha_tab.dart';
import 'package:islami_testing/provider/settings_provider.dart';
// import 'package:islami_testing/tabs/settings/settings_tab.dart';
import 'package:islami_testing/tabs/settings/settingstab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    Settings()
    // SettingsTab(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).islami,
            // AppLocalizations.of(context)!.islami
          ),
        ),
        // extendBodyBehindAppBar: true,
        body: Container(child: tabs[selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon:
                  const ImageIcon(AssetImage('assets/images/moshaf_gold.png')),
              label: S.of(context).quran,
              // AppLocalizations.of(context)!.quran,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(
                  AssetImage('assets/images/quran_quran_svgrepo_com.png')),
              label: S.of(context).hadeth,
              // AppLocalizations.of(context)!.hadeth,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage('assets/images/sebha_blue.png')),
              label:
                  // AppLocalizations.of(context)!.sebha,
                  S.of(context).sebha,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage('assets/images/radio.png')),
              label:
                  // AppLocalizations.of(context)!.radio,
                  S.of(context).radio,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.settings_outlined),
              label: S.of(context).settings,
              // AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
