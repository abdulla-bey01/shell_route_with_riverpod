import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutershell/pages/projects/_view/projects_page.dart';
import 'package:goroutershell/pages/tasks/_view/task_details_page.dart';
import 'package:goroutershell/pages/teams/_view/teams_page.dart';
import 'package:goroutershell/pages/root/root_page.dart';

import '../pages/tasks/_view/tasks_page.dart';

final router = GoRouter(
  initialLocation: '/tasks',
  errorPageBuilder: (context, state) => NoTransitionPage(
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ERROR! \n\n ${state.error}'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => context.go('/tasks'),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  ),
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: RootPage(child: child),
      ),
      routes: [
        ShellRoute(
          pageBuilder: (context, state, child) => NoTransitionPage(
            child: TasksPage(
              detailsPath: '/tasks/details',
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              path: '/tasks',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Center(
                  child: Text('Empty Screen'),
                ),
              ),
              routes: [
                GoRoute(
                  path: 'details/:id',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: TaskDetailsPage(
                        taskId: state.pathParameters['id'] ?? '',
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProjectsPage(),
          ),
        ),
        GoRoute(
          path: '/teams',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TeamsPage(),
          ),
        ),
      ],
    ),
  ],
);
