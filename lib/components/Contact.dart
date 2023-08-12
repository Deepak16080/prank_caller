import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionDenied) {
      return Center(child: Text('Please give a permission to access your contacts'));
    }
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return Scaffold(body: FutureBuilder<String>(builder: ((
      context,
      snapshot,
    ) {
      return ListView.builder(
          itemCount: _contacts!.length,
          itemBuilder: (context, i) {
            return ListTile(
                title: Text(_contacts![i].displayName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _contacts![i].phones.map((e) => Text(e.normalizedNumber)).toList(),
                ));
          });
    })));
  }
}
