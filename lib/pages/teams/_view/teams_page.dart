import 'package:flutter/material.dart';
import 'package:goroutershell/l10n/context_extensions.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.tr.teams),
    );
  }
}
