import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_testing/tabs/hadeeth/hadeeth_details_screen.dart';
import 'package:islami_testing/tabs/hadeeth/hadeth.dart';
import 'package:islami_testing/widgets/loading_indicator.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    ;
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Divider(
          height: 6,
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          ' الأحاديث ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Divider(
          height: 6,
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? const LoadingIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          HadeethDetailsScreen.routeName,
                          arguments: ahadeth[index]);
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
