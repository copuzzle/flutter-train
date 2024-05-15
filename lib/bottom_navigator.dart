import 'package:flutter/material.dart';
import 'package:app2/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.red, Icons.add),
        _buildItem(TabItem.green, Icons.location_on),
        _buildItem(TabItem.blue,Icons.people),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: currentTab.color,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(tabItem),
      ),
      label: tabItem.name,
    );
  }

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? item.color : Colors.grey;
  }
}
