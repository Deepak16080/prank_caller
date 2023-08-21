import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prank_caller/home_page.dart';

class PickUpUi extends StatefulWidget {
  final Contact contact;

  const PickUpUi({required this.contact, super.key});

  @override
  State<PickUpUi> createState() => _PickUpUiState();
}

class _PickUpUiState extends State<PickUpUi> {
  Icon? icon = Icon(
    Icons.call,
    size: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/Profile/profile.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  widget.contact.displayName,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '01:11:40', //add a duration
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180),
                padding: EdgeInsets.only(top: 30),
                height: 313.h,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)), color: Color(0xffE2F0F3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.dialpad,
                              ),
                              alignment: Alignment.center,
                              iconSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic_off_outlined,
                              ),
                              alignment: Alignment.center,
                              iconSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_up_outlined,
                              ),
                              alignment: Alignment.center,
                              iconSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_vert_outlined,
                              ),
                              alignment: Alignment.center,
                              iconSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Dialpad',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Mute',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'speaker',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'more',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 35,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          icon: Icon(Icons.call_end_outlined),
                          iconSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
