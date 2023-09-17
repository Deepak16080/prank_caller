// ignore: file_names
import "package:flutter/material.dart";
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
  final selectedindex = -1;
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
    return Scaffold(
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
          builder: ((
            context,
            snapshot,
          ) {
            return ListView.builder(
                itemCount: _contacts!.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () async {
                      if (selectedindex == i) {
                        return;
                      }
                      setState(() {});
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
                    ),
                  );
                });
          })),
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
                if (_contacts == null) {
                  toast(context, "Please select a contact");
                  return;
                }
                Navigator.pop(context, _contacts);
              },
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));
  }
}
