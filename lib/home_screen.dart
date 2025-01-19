import 'package:flutter/material.dart';
import 'package:islami_testing/tabs/hadeeth/hadeeth_tab.dart';
import 'package:islami_testing/tabs/quran/quran_tab.dart';
import 'package:islami_testing/tabs/radio/radio_tab.dart';
import 'package:islami_testing/tabs/sebha/sebha_tab.dart';
import 'package:islami_testing/tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    HadeethTab(),
    QuranTab(),
    SettingsTab(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        // extendBodyBehindAppBar: true,
        body: Container(child: tabs[selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/radio.png')),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/images/quran_quran_svgrepo_com.png')),
              label: 'Hadeeth',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/moshaf_gold.png')),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
