import 'package:flutter/material.dart';
import 'package:prank_caller/home_page.dart';

class PickUpUi extends StatefulWidget {
  const PickUpUi({super.key});

  @override
  State<PickUpUi> createState() => _PickUpUiState();
}

class _PickUpUiState extends State<PickUpUi> {
  String? name = 'Deepak Yadav';
  String? no = '+917665070041';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Center(
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      radius: 50,
                      child: Image.asset('assets/Profile/Profile2.png',fit: BoxFit.cover,)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      '$name', // add a name and number
                      style: const TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '00:00',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Container(
                      height: 330,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                          color: Color(0xffE2F0F3)),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.dialpad,
                                      ),
                                      alignment: Alignment.center,
                                      iconSize: 30,color: Colors.black,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.mic_off_outlined,
                                      ),
                                      alignment: Alignment.center,
                                      iconSize: 30,color: Colors.black,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.volume_up_outlined,
                                      ),
                                      alignment: Alignment.center,
                                      iconSize: 30,color: Colors.black,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert_outlined,
                                      ),
                                      alignment: Alignment.center,
                                      iconSize: 30,color: Colors.black,),
                                ),
                              ),
                            ],
                          ),
                           const Padding(
                             padding: EdgeInsets.only(bottom: 10),
                             child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Text(
                                    'Dialpad',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: Text(
                                    'Mute',
                                    style: TextStyle(fontSize: 16,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    'speaker',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    'more',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                              ),
                           ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
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
                                  icon: Icon(Icons.call_end_outlined),iconSize: 40,color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
