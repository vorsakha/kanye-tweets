import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          height: 180,
          width: double.infinity,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(55),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.tertiary,
                      ],
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 55,
                    child: CircleAvatar(
                      radius: 51,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/ye.jpg'),
                        radius: 50,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'ye',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(
                    Icons.verified,
                    size: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Text(
                '@kanyewest',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(
                    Icons.link,
                    size: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    child: Text(
                      'KANYEWEST.COM',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    onTap: () =>
                        {launchUrl(Uri.parse('https://kanyewest.com/'))},
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.calendar_month,
                    size: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Joined july 2010',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(children: [
                const Text(
                  '209',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text(
                  'Following',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  '30.8M',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text(
                  'Followers',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
