import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_testing/screens/hadeeth_details_screen.dart';
import 'package:islami_testing/models/hadeth_model.dart';
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

    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        const Divider(
          height: 6,
          thickness: 2,
        ),
        Text(
          ' الأحاديث ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(
          height: 2,
          thickness: 2,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        ahadeth[index].title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 2,
                    height: 2,
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
