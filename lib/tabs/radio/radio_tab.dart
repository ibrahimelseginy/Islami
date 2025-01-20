import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Image(
          image: AssetImage('assets/images/radio_image.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.skip_next_sharp,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.play_arrow_rounded,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.skip_previous_sharp,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ])
      ],
    );
  }
}
