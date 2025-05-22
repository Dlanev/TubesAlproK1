import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Options')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.history),
                    Expanded(
                      child: const Text(
                        'History ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.bar_chart),
                    Expanded(
                      child: const Text('Chart ', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.lightbulb),
                    Expanded(
                      child: const Text(
                        'More Info ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
