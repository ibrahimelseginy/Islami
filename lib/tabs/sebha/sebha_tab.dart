import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Column(
          children: [
            Image(
              height: 90,
              width: 170,
              image: AssetImage('assets/images/head_sebha_logo.png'),
            ),
            Image(
              height: 200,
              width: 280,
              image: AssetImage(
                'assets/images/body_sebha_logo.png',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor),
          child: Text(
            '33',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor),
          child: Text(
            'سبحان الله',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        )
      ],
    );
  }
}
