import 'package:flutter/material.dart';

class TutorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.green,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.green),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Math Tutor',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.star, 'Rating: 4.8/5'),
                  _buildInfoRow(Icons.attach_money, '\$30/hour'),
                  _buildInfoRow(Icons.location_on, 'New York, NY'),
                  SizedBox(height: 16),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Experienced math tutor with 5 years of teaching. Specializes in algebra and calculus.',
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Subjects',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(label: Text('Algebra')),
                      Chip(label: Text('Calculus')),
                      Chip(label: Text('Geometry')),
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Book a session
                    },
                    child: Text('Book a Session'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildReviewItem('Great tutor! Very patient and explains concepts clearly.'),
                  _buildReviewItem('Helped me improve my grades significantly.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String review) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 16)),
            ),
            SizedBox(height: 8),
            Text(review),
          ],
        ),
      ),
    );
  }
}