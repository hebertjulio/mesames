import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final OverviewData income;
  final OverviewData expense;
  final OverviewData save;
  final OverviewData budget;

  Overview({this.income, this.expense, this.save, this.budget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _OverviewItem(
                title: 'INCOME',
                data: this.income,
                color: Colors.blue,
                icon: Icons.account_balance_wallet,
                onTap: () {}),
            SizedBox(width: 8),
            _OverviewItem(
                title: 'EXPENSE',
                data: this.expense,
                color: Colors.red,
                icon: Icons.shopping_cart,
                onTap: () {}),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _OverviewItem(
                title: 'SAVE',
                data: this.save,
                color: Colors.green,
                icon: Icons.savings,
                onTap: () {}),
            SizedBox(width: 8),
            _OverviewItem(
                title: 'BUDGET',
                data: this.budget,
                color: Colors.orange,
                icon: Icons.calculate,
                onTap: () {}),
          ],
        ),
      ],
    );
  }
}

class _OverviewItem extends StatelessWidget {
  final String title;
  final OverviewData data;
  final Color color;
  final IconData icon;
  final Function onTap;

  _OverviewItem({this.title, this.data, this.color, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                        this.title,
                        style: TextStyle(
                          color: this.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        this.icon,
                        size: 18,
                        color: this.color,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    this.data.value,
                    style: TextStyle(
                      color: this.color,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  this.data.info,
                  style: TextStyle(
                    color: this.color,
                    fontSize: 14,
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

class OverviewData {
  final String value;
  final String info;

  OverviewData(this.value, this.info);
}
