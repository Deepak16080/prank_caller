import "package:flutter/material.dart";
import 'package:flutter_contacts/flutter_contacts.dart';

import '../utils/common.dart';

class ContactScreen extends StatefulWidget {
  final AlertDialog? dialog;
  const ContactScreen({super.key, required this.dialog});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? _contacts;
  Contact? selectedContact;
  var selectedindex = -1;
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
    if (_contacts!.isEmpty) {
      setState(() {
        _contacts = [];
      });
    }
    if (_contacts!.isNotEmpty) {
      setState(() {
        _contacts = _contacts!.where((element) => element.phones.isNotEmpty).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
          builder: (context, item) {
            if (_permissionDenied) {
              return Center(child: Text('Please give a permission to access your contacts'));
            }
            if (_contacts == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }
            if (_contacts!.isEmpty) return Center(child: Text('No contacts found'));
            return ListView.builder(
                itemCount: _contacts!.length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () async {
                        selectedContact = _contacts![i];
                        setState(() {
                          selectedindex = i;
                        });
                      },
                      child: Card(
                        color: selectedindex == i ? Colors.green : Colors.white,
                        shadowColor: Colors.green,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2.0,
                        child: ListTile(
                            title: Text(_contacts![i].displayName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _contacts![i].phones.map((e) => Text(e.number)).toList(),
                            )),
                      ));
                });
          }),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Contacts'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                if (selectedContact == null) {
                  toast(context, "Please select a contact");
                } else {
                  Navigator.pop(context, selectedContact!);
                }
              },
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
