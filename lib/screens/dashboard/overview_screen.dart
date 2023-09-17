import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OverviewScreen extends StatelessWidget {
  final String username; // Add a username parameter

  OverviewScreen({required this.username}); // Constructor to receive the username

  @override
  Widget build(BuildContext context) {
    // Sample data for expense categories and amounts
    final List<ExpenseCategory> categories = [
      ExpenseCategory('Groceries', 500.0, Colors.blue),
      ExpenseCategory('Transportation', 200.0, Colors.green),
      ExpenseCategory('Dining Out', 300.0, Colors.orange),
      ExpenseCategory('Entertainment', 150.0, Colors.purple),
    ];

    // Create a pie chart
    final chart = charts.PieChart(
      [
        for (final category in categories)
          charts.Series<ExpenseCategory, String>(
            id: category.name,
            domainFn: (ExpenseCategory category, _) => category.name,
            measureFn: (ExpenseCategory category, _) => category.amount,
            colorFn: (ExpenseCategory category, _) =>
                charts.ColorUtil.fromDartColor(category.color),
            data: [category],
            labelAccessorFn: (ExpenseCategory category, _) =>
            '\$${category.amount.toStringAsFixed(2)}',
          ),
      ],
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.auto,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$username's Expense Tracker", // Use the username here
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Text color
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.dashboard),
          onPressed: () {
            // Navigate to the Dashboard screen
            Navigator.of(context).push(_dashboardPageRoute());
          },
          color: Colors.black, // Icon color
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to app settings
            },
            color: Colors.black, // Icon color
          ),
        ],
        backgroundColor: Colors.white, // App bar background color
      ), // App bar background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600], // Secondary color
                        ),
                      ),
                      Text(
                        '\$5,000.00',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Expense Categories',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 300.0,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: chart,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Recent Expenses',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                children: List.generate(
                  5, // Replace with actual expense count
                      (index) => ExpenseItem(
                    category: 'Groceries',
                    amount: 50.0,
                    date: 'Sep 12, 2023',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add an expense
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red, // Primary color
      ),
    );
  }

  // Create a PageRoute for the Dashboard screen
  PageRouteBuilder _dashboardPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DashboardScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}

class ExpenseCategory {
  final String name;
  final double amount;
  final Color color;

  ExpenseCategory(this.name, this.amount, this.color);
}

class ExpenseItem extends StatelessWidget {
  final String category;
  final double amount;
  final String date;

  ExpenseItem({
    required this.category,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red, // Primary color
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        title: Text(category),
        subtitle: Text('\$${amount.toStringAsFixed(2)} - $date'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Edit expense
          },
          color: Colors.black, // Icon color
        ),
      ),
    );
  }
}

// Dashboard screen to display additional information
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.red, // Primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            SizedBox(height: 16.0),
            // Add more dashboard information here
          ],
        ),
      ),
    );
  }
}
