import 'package:flutter/material.dart';

class MonthlyBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              label: Text('Jan/2021'),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: Text('Mar/2021'),
              label: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
