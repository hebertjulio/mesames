import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ChartByCategory extends StatelessWidget {
  final List<ChartByCategoryData> _data;

  ChartByCategory(this._data) : assert(_data != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Expenses by Category',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children:
              this._data.map((data) => _ChartByCategoryItem(data)).toList(),
        ),
      ],
    );
  }
}

class _ChartByCategoryItem extends StatelessWidget {
  final ChartByCategoryData _data;

  _ChartByCategoryItem(
    this._data,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this._data.categoryName,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${this._data.currency} ${this._data.totalValue}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              LinearPercentIndicator(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                percent: this._data.totalPercentage / 100,
                lineHeight: 16,
                progressColor: Colors.red,
                backgroundColor: Colors.orange.withOpacity(0.5),
                center: Text(
                  '${this._data.totalPercentage}%',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Budget ${this._data.budgetpercentage}% of Income (${this._data.currency} ${this._data.budgetValue})',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartByCategoryData {
  final String categoryName;
  final String currency;
  final double totalPercentage;
  final double totalValue;
  final double budgetValue;
  final double budgetpercentage;

  ChartByCategoryData(
    this.categoryName,
    this.currency,
    this.totalValue,
    this.totalPercentage,
    this.budgetValue,
    this.budgetpercentage,
  );
}
