import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/using_listview/concatlist/concat_list.dart';
import 'package:flutter_examples_code/view/using_listview/concatlist/modal/concat.dart';

class UsingListView extends StatelessWidget {
  _buildContactList(){
    return <ContactModal>[
      const ContactModal(
        fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Domain Hoogmoed', email: 'Domain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Fmilie Olsen', email: 'Fmilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Gomain Hoogmoed', email: 'Gomain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Lmilie Olsen', email: 'Lmilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Comain Hoogmoed', email: 'Comain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Omilie Olsen', email: 'Omilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Gomain Hoogmoed', email: 'Gomain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Lmilie Olsen', email: 'Lmilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Comain Hoogmoed', email: 'Comain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Omilie Olsen', email: 'Omilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Gomain Hoogmoed', email: 'Gomain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Lmilie Olsen', email: 'Lmilie.olsen@example.com'
      ),
      const ContactModal(
        fullName: 'Comain Hoogmoed', email: 'Comain.hoogmoed@example.com'
      ),
      const ContactModal(
        fullName: 'Omilie Olsen', email: 'Omilie.olsen@example.com'
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Using ListView'),
      ),
      body: new ContactsList(_buildContactList()),
    );
  }
}