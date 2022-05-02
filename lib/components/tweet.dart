import 'package:flutter/material.dart';

class Tweet extends StatelessWidget {
  final String tweet;
  final Color? color;

  const Tweet({Key? key, required this.tweet, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
      decoration: BoxDecoration(
        color: color ?? Colors.redAccent,
        border: const Border(
          bottom: BorderSide(
            width: 0.7,
            color: Color.fromARGB(255, 255, 130, 142),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/ye.jpg'),
            backgroundColor: Colors.black,
            radius: 30,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'ye',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Icon(
                      Icons.verified,
                      size: 16,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '@kanyewest',
                      style: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.red),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                const SizedBox(width: 15),
                Text(
                  tweet,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
