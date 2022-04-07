import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildMenuItem(
      String title, IconData icon, VoidCallback onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up !',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildMenuItem('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          _buildMenuItem('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed('/settings');
          }),
        ],
      ),
    );
  }
}
