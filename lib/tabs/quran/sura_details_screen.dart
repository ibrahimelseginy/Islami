import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;

    if (ayat.isEmpty) {
      loadSuraFile(args.index);
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: ayat.isEmpty
            ? const LoadingIndicator()
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppTheme.white,
                ),padding: EdgeInsets.all(20),
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    ayat[index],
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  itemCount: ayat.length,
                ),
              ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    // read file logic
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    ayat = sura.split('/n');
    setState(() {});
  }
}

class SuraDetailsArgs {
  int index;
  String suraName;
  SuraDetailsArgs(this.index, this.suraName);
}
