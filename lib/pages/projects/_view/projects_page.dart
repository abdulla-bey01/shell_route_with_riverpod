import 'package:flutter/material.dart';
import 'package:goroutershell/l10n/context_extensions.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.tr.projects),
    );
  }
}
