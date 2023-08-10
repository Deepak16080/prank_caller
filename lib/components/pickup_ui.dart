import 'package:flutter/material.dart';

class PickUpUi extends StatefulWidget {
  const PickUpUi({super.key});

  @override
  State<PickUpUi> createState() => _PickUpUiState();
}

class _PickUpUiState extends State<PickUpUi> {
  String? name = 'Gaurav';
  String? no = '+917665070041';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Stack(children: [
          Center(
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey.shade400,
                      child: const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      '$name',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '$no',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '00:00',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.only(top: 260),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 45,),
                              child: Icon(Icons.video_call,size: 50,),
                              
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 45),
                          child: Icon(Icons.add,size: 50,),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 45),
                          child: Icon(Icons.note_add,size: 40,)
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Row(
                          children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45),
                            child: Icon(Icons.mic_off_outlined,size: 50,),
                            
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Icon(Icons.pause_circle_filled_rounded,size: 50,),                    
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Icon(Icons.record_voice_over_outlined,size: 40,)
                          ),
                          ],),
                        ),
                         Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                          children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Icon(Icons.speaker_phone_rounded,size: 50,),
                            
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.call_end,size: 40),
                            )                    
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Icon(Icons.more_horiz_rounded,size: 40,)
                          ),
                          ],),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ]));
  }
}

