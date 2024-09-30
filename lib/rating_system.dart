import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSystem extends StatefulWidget {
  @override
  _RatingSystemState createState() => _RatingSystemState();
}

class _RatingSystemState extends State<RatingSystem> {
  double _rating = 0;
  String _comments = '';

  void _submitFeedback() {
    // Logic to handle feedback submission
    print('Rating: $_rating');
    print('Comments: $_comments');
    // Here, you can send the feedback to your server or database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Your Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please rate your waste collection experience:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _comments = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Comments',
                border: OutlineInputBorder(),
                hintText: 'Share your feedback...',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
