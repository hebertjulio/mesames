import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Overview(
                  income: OverviewData('R\$ 2000,00', '+5%'),
                  expense: OverviewData('R\$ 1500,00', '+5%'),
                  save: OverviewData('R\$ 500,00', '30% da Receita'),
                  budget: OverviewData('R\$ 3000,00', '70% da Receita'),
                ),
              ),
              ChartByCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
