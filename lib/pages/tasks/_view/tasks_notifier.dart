import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goroutershell/model/task.dart';
import 'package:goroutershell/service/network_service.dart';

final tasksNotifierProvider = FutureProvider<List<Task>>((ref) async {
  final networkService = ref.read(networkServiceProvider);
  return networkService.getTasks();
});

final taskNotifierProvider = FutureProvider.family.autoDispose<Task, String>((ref, id) async {
  final networkService = ref.read(networkServiceProvider);
  return networkService.getTaskById(id);
});
