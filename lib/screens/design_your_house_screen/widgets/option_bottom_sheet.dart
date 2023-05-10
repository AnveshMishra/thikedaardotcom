import 'package:flutter/material.dart';

void showOptionBottomSheet(context,
    {required String title, required Function(String) onTap}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(48),
      ),
    ),
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Yes'),
            onTap: () {
              onTap.call('Yes');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('No'),
            onTap: () {
              onTap.call('No');
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
