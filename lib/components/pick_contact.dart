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
  List<Contact> contacts = [];
  Contact? selectedContact;

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
      contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: ((
        context,
      ) {
        if (_permissionDenied) {
          return Center(child: Text('Please give a permission to access your contacts'));
        }
        if (contacts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, i) {
              bool isSelected = selectedContact == contacts[i];
              return InkWell(
                onTap: () async {
                  selectedContact = contacts[i];
                  setState(() {});
                },
                child: Card(
                  color: isSelected ? Colors.green : Colors.white,
                  shadowColor: Colors.green,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2.0,
                  child: ListTile(
                      title: Text(contacts[i].displayName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: contacts[i].phones.map((e) => Text(e.number)).toList(),
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
                if (selectedContact == null) {
                  toast(context, "Please select a contact");
                  return;
                }
                Navigator.pop(context, selectedContact);
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
