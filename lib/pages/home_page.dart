import 'package:flutter/material.dart';
import 'package:mesames/components/bottom_navigator.dart';
import 'package:mesames/components/chart_by_category.dart';
import 'package:mesames/components/overview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesames'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Overview(
                  OverviewData('R\$', 2000, '+5%'),
                  OverviewData('R\$', 1500, '+5%'),
                  OverviewData('R\$', 500, '30% da Receita'),
                  OverviewData('R\$', 3000, '70% da Receita'),
                ),
              ),
              ChartByCategory(<ChartByCategoryData>[
                ChartByCategoryData('Moradia', 'R\$', 1400, 65, 3000, 40),
                ChartByCategoryData('Transporte', 'R\$', 500, 12, 540, 5),
                ChartByCategoryData('Alimentação', 'R\$', 782, 35, 670, 10),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MonthlyBottomNavigator(),
    );
  }
}
