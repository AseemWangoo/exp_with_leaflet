import 'package:flutter/material.dart';

class PlaceDialog extends StatelessWidget {
  const PlaceDialog(
      {Key key,
      Widget desc = const Text('Hii'),
      String title = 'Title',
      String actionButtonText = 'OK'})
      : _desc = desc,
        _title = title,
        _actionButtonText = actionButtonText,
        super(key: key);

  final String _actionButtonText;
  final Widget _desc;
  final String _title;

  @override
  Widget build(BuildContext context) {
    //

    return AlertDialog(
      title: Text(_title),
      content: _desc,
      actions: [
        FlatButton(
          child: Text(_actionButtonText),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
