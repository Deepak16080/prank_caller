import 'package:prank_caller/Provider/ads_provider.dart';
import "package:flutter/material.dart";
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../utils/common.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
  });

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
    AdsProvider adsprovider = Provider.of<AdsProvider>(context, listen: false);
    adsprovider.initializeContactpagebanner();
    adsprovider.initializefullpageads();
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
    return WillPopScope(
      onWillPop: () async {
        AdsProvider adsprovider = Provider.of<AdsProvider>(context, listen: false);
        if (adsprovider.isfullpageadloaded) {
          adsprovider.fullPagead;
        }
        return true;
      },
      child: Scaffold(
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
        bottomNavigationBar: Consumer<AdsProvider>(builder: (context, AdsProvider adProvider, child) {
          if (adProvider.iscontactpagebannerloaded) {
            return SizedBox(
              height: adProvider.contactpagebanner.size.height.toDouble(),
              width: adProvider.contactpagebanner.size.width.toDouble(),
              child: AdWidget(ad: adProvider.contactpagebanner),
            );
          } else {
            return SizedBox(
              height: 0,
            );
          }
        }),
      ),
    );
  }
}
