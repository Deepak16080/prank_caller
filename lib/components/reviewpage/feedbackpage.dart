import 'package:flutter/material.dart';
import 'package:prank_caller/utils/common.dart';
import 'package:prank_caller/widget/box.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Send Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: descriptionController,
              decoration:
                  InputDecoration(fillColor: Colors.white, border: OutlineInputBorder(), labelText: 'Description'),
            ),
            HBox(20),
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Feedback',
                  alignLabelWithHint: true),
              maxLines: 4,
            ),
            HBox(20),
            MaterialButton(
                onPressed: () {
                  if (feedbackController.text.isEmpty) {
                    toast(context, 'Please enter feedback');
                    return;
                  }
                  submitFeedback();
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text('Submit Feedback', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  void submitFeedback() {
    toast(context, 'Feedback submitted');
  }

//   void _sendFeedback() async {
//     String feedback = _feedbackController.text;
//     String email = 'dy16080@gmail.com'; // Replace with your Gmail address

//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: email,
//       queryParameters: {'subject': 'Feedback for Your App', 'body': feedback},
//     );

//     if (await canLaunchUrl(Uri.parse(emailLaunchUri.toString()))) {
//       await launchUrl(Uri.parse(emailLaunchUri.toString()));
//     } else {
//       throw 'Could not launch email';
//     }
//   }
// }
}
