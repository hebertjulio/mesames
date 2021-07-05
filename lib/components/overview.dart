import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final OverviewData _incomeData;
  final OverviewData _expenseData;
  final OverviewData _saveData;
  final OverviewData _budgetData;

  Overview(
    this._incomeData,
    this._expenseData,
    this._saveData,
    this._budgetData,
  )   : assert(_incomeData != null),
        assert(_expenseData != null),
        assert(_saveData != null),
        assert(_budgetData != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _OverviewItem('INCOME', this._incomeData, Colors.blue,
                  Icons.account_balance_wallet, () {}),
              SizedBox(width: 8),
              _OverviewItem('EXPENSE', this._expenseData, Colors.red,
                  Icons.shopping_cart, () {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _OverviewItem('BUDGET', this._budgetData, Colors.orange,
                  Icons.calculate, () {}),
              SizedBox(width: 8),
              _OverviewItem(
                  'SAVE', this._saveData, Colors.green, Icons.savings, () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _OverviewItem extends StatelessWidget {
  final String _title;
  final OverviewData _data;
  final Color _color;
  final IconData _icon;
  final Function _onTap;

  _OverviewItem(
    this._title,
    this._data,
    this._color,
    this._icon,
    this._onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: this._onTap,
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
                        this._title.toUpperCase(),
                        style: TextStyle(
                          color: this._color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        this._icon,
                        size: 18,
                        color: this._color,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "${this._data.currency} ${this._data.value}",
                    style: TextStyle(
                      color: this._color,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  this._data.footer,
                  style: TextStyle(
                    color: this._color,
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
  final String currency;
  final double value;
  final String footer;

  OverviewData(
    this.currency,
    this.value,
    this.footer,
  );
}
