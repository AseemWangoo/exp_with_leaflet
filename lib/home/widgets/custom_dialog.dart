import 'package:flutter/material.dart';

class PlaceDialog extends StatelessWidget {
  const PlaceDialog(
      {Key key,
      String desc = 'Here comes the desc',
      String title = 'Title',
      String actionButtonText = 'OK'})
      : _desc = desc,
        _title = title,
        _actionButtonText = actionButtonText,
        super(key: key);

  final String _actionButtonText;
  final String _desc;
  final String _title;

  @override
  Widget build(BuildContext context) {
    //

    return AlertDialog(
      title: Text(_title),
      content: Text(_desc),
      actions: [
        FlatButton(
          child: Text(_actionButtonText),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
