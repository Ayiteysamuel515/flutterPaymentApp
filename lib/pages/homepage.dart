import 'package:flutter/material.dart';
import 'payment.dart'; // Import the PaymentScreen from another file

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;
  bool isSearchVisible = false; // To track the search bar visibility
  String searchQuery = ''; // Store the search query

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color(0xFF1E2A38), // Dark background color for the app bar
          elevation: 2, // Slight elevation for a subtle shadow
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.account_circle,
                color: Colors.white, size: 28), // Account Icon only
          ),
          actions: [
            // Search Icon
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 28),
              onPressed: () {
                setState(() {
                  isSearchVisible =
                      !isSearchVisible; // Toggle search bar visibility
                });
              },
            ),
            // Dropdown Toggle (hamburger) Icon Button
            IconButton(
              icon: const Icon(Icons.menu,
                  color: Colors.white, size: 28), // Hamburger Icon
              onPressed: () {
                _showDropdownMenu();
              },
            ),
          ],
        ),
        body: Container(
          color:
              const Color(0xFF4E586E), // Body background color (grayish blue)
          child: Column(
            children: [
              if (isSearchVisible)
                _buildSearchBar(), // Show search bar if toggled on
              const TabBar(
                labelColor:
                    Color(0xFFFFD428), // Vibrant yellow for selected tab
                indicatorColor: Color(0xFFFFD428), // Yellow indicator color
                unselectedLabelColor:
                    Colors.white60, // Lighter white for unselected labels
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'DPAY'),
                  Tab(text: 'TOPUP'),
                  Tab(text: 'SERVICES'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildDpayTab(), // DPAY tab content
                    _buildTopupTab(), // TOPUP tab content
                    _buildTabContent('SERVICES Features'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              const Color(0xFF1E2A38), // Same dark color for footer
          selectedItemColor:
              const Color(0xFFFFD428), // Yellow color for selected item
          unselectedItemColor: Colors.grey, // Grey color for unselected items
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 24),
              label: 'Notify',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout, size: 24),
              label: 'Logout',
            ),
          ],
          onTap: (index) {
            if (index == 2) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Viewing Notifications')),
              );
            }
          },
        ),
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value; // Update the search query as user types
          });
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                searchQuery = ''; // Clear search query
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Dropdown menu for the toggle icon
  void _showDropdownMenu() {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(300, 0, 0, 50), // Adjust position
      items: [
        PopupMenuItem(
          child: Container(
            color: const Color(0xFF1E2A38), // Background color for the dropdown
            child: ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFFFFD428)),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add action for settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings clicked')),
                );
              },
            ),
          ),
        ),
        PopupMenuItem(
          child: Container(
            color: const Color(0xFF1E2A38), // Background color for the dropdown
            child: ListTile(
              leading: const Icon(Icons.help_outline, color: Color(0xFFFFD428)),
              title: const Text('Help', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add action for help
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Help clicked')),
                );
              },
            ),
          ),
        ),
        PopupMenuItem(
          child: Container(
            color: const Color(0xFF1E2A38), // Background color for the dropdown
            child: ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFFFD428)),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add action for logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout clicked')),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Build DPAY tab content with a list of payment items (side by side)
  Widget _buildDpayTab() {
    List<Map<String, dynamic>> items = [
      {'title': 'Make Payments', 'icon': Icons.payment},
      {'title': 'Mobile Top-Up', 'icon': Icons.phone_android},
      {'title': 'Bank Transfers', 'icon': Icons.account_balance},
      {'title': 'International Payments', 'icon': Icons.language},
      {'title': 'DSTV', 'icon': Icons.tv},
      {'title': 'Transport', 'icon': Icons.directions_bus},
      {'title': 'ECG', 'icon': Icons.bolt},
      {'title': 'More Bills', 'icon': Icons.list},
      {'title': 'Send Money', 'icon': Icons.send},
      {'title': 'Cashout', 'icon': Icons.money},
      {'title': 'Transactions', 'icon': Icons.history},
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Four items per row
        crossAxisSpacing: 8, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
        childAspectRatio: 1.2, // Adjust aspect ratio for smaller cards
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (items[index]['title'] == 'Make Payments') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${items[index]['title']}')),
              );
            }
          },
          child: Card(
            color: const Color(0xFF4E586E), // Card color (dark)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  items[index]['icon'],
                  color: const Color(0xFFFFD428), // Icon color (yellow)
                  size: 24, // Reduced icon size
                ),
                const SizedBox(height: 6),
                Text(
                  items[index]['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, // Reduced font size
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build TOPUP tab content with icons
  Widget _buildTopupTab() {
    List<Map<String, dynamic>> items = [
      {'title': 'Airtime', 'icon': Icons.phone},
      {'title': 'Data', 'icon': Icons.wifi},
      {'title': 'Electricity', 'icon': Icons.flash_on},
      {'title': 'TV Subscription', 'icon': Icons.tv},
      {'title': 'Internet', 'icon': Icons.router},
      {'title': 'Cable', 'icon': Icons.settings_input_antenna},
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Three items per row for Topup
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on ${items[index]['title']}')),
            );
          },
          child: Card(
            color: const Color(0xFF4E586E), // Dark background color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  items[index]['icon'],
                  color: const Color(0xFFFFD428), // Yellow icon color
                  size: 24,
                ),
                const SizedBox(height: 6),
                Text(
                  items[index]['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12, // Slightly larger font size
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Generic content for other tabs
  Widget _buildTabContent(String content) {
    return Center(
      child: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
