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
          color: Colors.black,
          height: 180,
          width: double.infinity,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ye.jpg'),
                  radius: 50,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text(
                    'ye',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(
                    Icons.verified,
                    size: 20,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(width: 5),
              const Text(
                '@kanyewest',
                style:
                    TextStyle(fontWeight: FontWeight.w200, color: Colors.red),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Icons.link, size: 16),
                  const SizedBox(width: 5),
                  InkWell(
                    child: const Text(
                      'KANYEWEST.COM',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () =>
                        {launchUrl(Uri.parse('https://kanyewest.com/'))},
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.calendar_month, size: 16),
                  const SizedBox(width: 5),
                  const Text(
                    'Joined july 2010',
                    style: TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(children: const [
                Text(
                  '209',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  'Following',
                  style:
                      TextStyle(fontWeight: FontWeight.w200, color: Colors.red),
                ),
                SizedBox(width: 20),
                Text(
                  '30.8M',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  'Followers',
                  style:
                      TextStyle(fontWeight: FontWeight.w200, color: Colors.red),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
