// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int?,
      title: json['title'] as String,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, non_constant_identifier_names

mixin $TaskLocalAdapter on LocalAdapter<Task> {
  @override
  Map<String, Map<String, Object?>> relationshipsFor([Task? model]) => {};

  @override
  Task deserialize(map) {
    for (final key in relationshipsFor().keys) {
      map[key] = {
        '_': [map[key], !map.containsKey(key)],
      };
    }
    return _$TaskFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model) => _$TaskToJson(model);
}

// ignore: must_be_immutable
class $TaskHiveLocalAdapter = HiveLocalAdapter<Task> with $TaskLocalAdapter;

class $TaskRemoteAdapter = RemoteAdapter<Task> with JSONServerAdapter;

//

final tasksLocalAdapterProvider =
    Provider<LocalAdapter<Task>>((ref) => $TaskHiveLocalAdapter(ref.read));

final tasksRemoteAdapterProvider = Provider<RemoteAdapter<Task>>((ref) =>
    $TaskRemoteAdapter(
        ref.watch(tasksLocalAdapterProvider), taskProvider, tasksProvider));

final tasksRepositoryProvider =
    Provider<Repository<Task>>((ref) => Repository<Task>(ref.read));

final _taskProvider = StateNotifierProvider.autoDispose
    .family<DataStateNotifier<Task?>, DataState<Task?>, WatchArgs<Task>>(
        (ref, args) {
  return ref.watch(tasksRepositoryProvider).watchOneNotifier(args.id,
      remote: args.remote,
      params: args.params,
      headers: args.headers,
      alsoWatch: args.alsoWatch);
});

AutoDisposeStateNotifierProvider<DataStateNotifier<Task?>, DataState<Task?>>
    taskProvider(dynamic id,
        {bool? remote,
        Map<String, dynamic>? params,
        Map<String, String>? headers,
        AlsoWatch<Task>? alsoWatch}) {
  return _taskProvider(WatchArgs(
      id: id,
      remote: remote,
      params: params,
      headers: headers,
      alsoWatch: alsoWatch));
}

final _tasksProvider = StateNotifierProvider.autoDispose.family<
    DataStateNotifier<List<Task>>,
    DataState<List<Task>>,
    WatchArgs<Task>>((ref, args) {
  return ref.watch(tasksRepositoryProvider).watchAllNotifier(
      remote: args.remote,
      params: args.params,
      headers: args.headers,
      syncLocal: args.syncLocal);
});

AutoDisposeStateNotifierProvider<DataStateNotifier<List<Task>>,
        DataState<List<Task>>>
    tasksProvider(
        {bool? remote,
        Map<String, dynamic>? params,
        Map<String, String>? headers,
        bool? syncLocal}) {
  return _tasksProvider(WatchArgs(
      remote: remote, params: params, headers: headers, syncLocal: syncLocal));
}

extension TaskX on Task {
  /// Initializes "fresh" models (i.e. manually instantiated) to use
  /// [save], [delete] and so on.
  ///
  /// Can be obtained via `ref.read`, `container.read`
  Task init(Reader read, {bool save = true}) {
    final repository = internalLocatorFn(tasksRepositoryProvider, read);
    final updatedModel =
        repository.remoteAdapter.initializeModel(this, save: save);
    return save ? updatedModel : this;
  }
}
