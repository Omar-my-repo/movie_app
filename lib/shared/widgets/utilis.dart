import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircularProgressIndicator(),
              Text(
                'Loading',
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
  BuildContext context,
  String message,
  String positiveBtnTxt,
  Function positiveBtnAct, {
  String? negativeBtnTxt,
  Function? negativeBtnAct,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            TextButton(
              onPressed: () {
                positiveBtnAct(context);
              },
              child: Text(positiveBtnTxt),
            ),
          ],
        );
      });
}
