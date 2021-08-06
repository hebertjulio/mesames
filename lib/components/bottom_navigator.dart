import 'package:flutter/material.dart';

class MonthlyBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MonthlyButtonBottomNavigator(
            'Jan/2021',
            reversed: false,
            onTap: () {},
          ),
          MonthlyButtonBottomNavigator(
            'Mar/2021',
            reversed: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MonthlyButtonBottomNavigator extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool reversed;

  MonthlyButtonBottomNavigator(this.text, {@required this.onTap, this.reversed})
      : assert(text != null);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Icon(
          this.reversed ? Icons.arrow_forward : Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      Container(
        width: 100,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ];

    return Expanded(
      child: InkWell(
        child: Ink(
          height: Size.fromHeight(50).height,
          child: Row(
            mainAxisAlignment:
                this.reversed ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: this.reversed ? children.reversed.toList() : children,
          ),
        ),
        onTap: this.onTap,
      ),
    );
  }
}
