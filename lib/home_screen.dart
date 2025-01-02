import 'package:flutter/material.dart';
import 'package:islami_testing/hadeeth_tab.dart';
import 'package:islami_testing/quran_tab.dart';
import 'package:islami_testing/radio_tab.dart';
import 'package:islami_testing/sebha_tab.dart';

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
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
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
        ],
      ),
    );
  }
}
