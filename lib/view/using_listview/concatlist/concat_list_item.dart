import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/using_listview/concatlist/modal/concat.dart';

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;

  ContactListItem(this._contactModal); 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: new CircleAvatar(child: new Text(_contactModal.fullName[0])),
      title: new Text(_contactModal.fullName),
      subtitle: new Text(_contactModal.email),
    );
  }
}