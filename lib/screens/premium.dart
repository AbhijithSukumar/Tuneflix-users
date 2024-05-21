import 'package:flutter/material.dart';
import 'package:tuneflix_user/routes.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({super.key});

  @override
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  int selectedPlan = 0; // 0 - Free, 1 - Premium

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo (Replace with your Tuneflix logo)
            Text(
              'Choose Your Tuneflix Plan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildPlanCard(title: 'Free', subtitle: 'Basic features, limited content', isFree: true),
            SizedBox(height: 15),
            _buildPlanCard(title: 'Premium', subtitle: 'Full access, HD quality, exclusive content', isFree: false),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.payment);
                // Handle button press based on selected plan (navigation to payment screen etc.)
                if (selectedPlan == 0) {
                  // Free plan selected
                } else {
                  // Premium plan selected
                }
              },
              child: Text('Subscribe Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle button press based on selected plan (navigation to payment screen etc.)
                if (selectedPlan == 0) {
                  // Free plan selected
                } else {
                  // Premium plan selected
                }
              },
              child: Text('Continue with free'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white10,
                minimumSize: Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({required String title, required String subtitle, required bool isFree}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          if (!isFree)
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  'Premium Features',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
