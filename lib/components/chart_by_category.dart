import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ChartByCategory extends StatelessWidget {
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
          children: [
            CategoryBarChart('Moradia', 40, 1500),
            SizedBox(height: 8),
            CategoryBarChart('Transporte', 15, 500),
            SizedBox(height: 8),
            CategoryBarChart('Hobbies', 4, 100),
            SizedBox(height: 8),
            CategoryBarChart('Educação', 35, 1300),
            SizedBox(height: 8),
            CategoryBarChart('Saúde', 17, 900),
            SizedBox(height: 8),
            CategoryBarChart('Viagem', 26, 1900),
            SizedBox(height: 8),
            CategoryBarChart('Livros', 17, 900),
            SizedBox(height: 8),
            CategoryBarChart('Mercado', 57, 5900),
          ],
        ),
      ],
    );
  }
}

class CategoryBarChart extends StatelessWidget {
  final String _category;
  final double _percentage;
  final double _value;

  CategoryBarChart(
    this._category,
    this._percentage,
    this._value,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 8,
            top: 16,
            child: Icon(
              Icons.tag,
              size: 32,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 48,
              top: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _category,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'R\$ ${this._value}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                LinearPercentIndicator(
                  percent: _percentage / 100,
                  lineHeight: 14,
                  progressColor: Colors.red,
                  backgroundColor: Colors.red.withOpacity(0.4),
                  center: Text(
                    '${this._percentage}%',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
    );
  }
}
