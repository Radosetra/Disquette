import 'package:flutter/material.dart';

class DisquetteAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DisquetteAppBar({
    super.key,
    required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
}