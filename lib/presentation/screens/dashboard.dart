import 'package:flutter/material.dart';
import 'package:task_bloc/presentation/screens/watchlist_screen.dart';
import '../../core/utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0; // Tracks the selected tab
  final List<Widget> _screens = [
    const WatchlistScreen(), // First tab: Watchlist
    Scaffold(
        appBar: AppBar(
          title: const Text(
            "Orders",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body:
            const Center(child: Text("Orders Screen"))), // Placeholder for Orders tab
    Scaffold(
        appBar: AppBar(
          title: const Text(
            "Portfolio",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: const Center(
            child: Text("Portfolio Screen"))), // Placeholder for Portfolio tab
    Scaffold(
        appBar: AppBar(
          title: const Text(
            "Movers",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body:
            const Center(child: Text("Movers Screen"))), // Placeholder for Movers tab
    Scaffold(
        appBar: AppBar(
          title: const Text(
            "More",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: const Center(child: Text("More Screen"))), // Placeholder for More tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.grey,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Movers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
