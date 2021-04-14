import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text(answerText),
        ),
      ),
    );
  }
}
