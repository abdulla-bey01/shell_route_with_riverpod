import 'package:flutter/material.dart';
import 'package:goroutershell/l10n/context_extensions.dart';

import '../common/app_style.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key, required this.onClickTabItem, required this.selectedIndex})
      : super(key: key);
  final Function onClickTabItem;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final navigationBarItems = [
      NavigationBarItem(name: context.tr.tasks, url: 'tasks'),
      NavigationBarItem(name: context.tr.projects, url: 'projects'),
      NavigationBarItem(name: context.tr.teams, url: 'teams'),
    ];

    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          item: navigationBarItems[index],
          onClick: () => onClickTabItem(index),
          isSelected: index == selectedIndex,
        ),
        separatorBuilder: (context, index) => const Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
    required this.onClick,
    required this.isSelected,
  }) : super(key: key);
  final NavigationBarItem item;
  final Function onClick;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          item.name,
          style: TextStyle(
            color: isSelected ? AppStyle.red : AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
