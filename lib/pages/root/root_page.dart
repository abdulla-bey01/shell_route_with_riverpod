import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutershell/l10n/localization_provider.dart';
import '../../widgets/app_navigation_bar.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            height: MediaQuery.of(context).size.height,
            child: Consumer(builder: (context, ref, _) {
              final localeNotifier = ref.read(localizationProvider.notifier);
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    width: 200,
                    child: AppNavigationBar(
                      onClickTabItem: (int index) => _onItemTapped(index, context),
                      selectedIndex: _calculateSelectedIndex(router.location),
                    ),
                  ),
                  ...['en', 'ar'].map((loc) {
                    return ElevatedButton(
                      onPressed: () {
                        localeNotifier.changeLocale(Locale(loc));
                      },
                      child: Text(loc),
                    );
                  }).toList(),
                ],
              );
            }),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/projects')) {
      return 1;
    } else if (location.startsWith('/teams')) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 1:
        GoRouter.of(context).go('/projects');
        break;
      case 2:
        GoRouter.of(context).go('/teams');
        break;
      case 0:
      default:
        GoRouter.of(context).go('/tasks');
        break;
    }
  }
}
