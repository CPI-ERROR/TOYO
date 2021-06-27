import 'package:flutter/material.dart';

class Richtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 22),
          children: <TextSpan>[
            TextSpan(
                text: 'IITV',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black54)),
            TextSpan(
                text: 'Quiz',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
