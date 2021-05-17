import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Overview',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OverviewItem(
              'Budget',
              'R\$ 2.000,00',
              'Left R\$ 500,00',
              Colors.orange,
              () {},
              Icons.edit,
            ),
            SizedBox(width: 4),
            OverviewItem(
              'Income',
              'R\$ 2.000,00',
              'Left R\$ 500,00',
              Colors.green,
              () {},
              Icons.list,
            ),
            SizedBox(width: 4),
            OverviewItem(
              'Expenses',
              'R\$ 1.500,00',
              'Up +5%',
              Colors.red,
              () {},
              Icons.list,
            ),
          ],
        ),
      ],
    );
  }
}

class OverviewItem extends StatelessWidget {
  final String _title;
  final String _text;
  final String _subtext;
  final Color _color;
  final Function _onTap;
  final IconData _icon;

  OverviewItem(
    this._title,
    this._text,
    this._subtext,
    this._color,
    this._onTap,
    this._icon,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: this._onTap,
        child: Container(
          decoration: BoxDecoration(
            color: this._color,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        this._title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Visibility(
                        visible: this._onTap != null,
                        child: Icon(
                          this._icon,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    this._text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  this._subtext,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
