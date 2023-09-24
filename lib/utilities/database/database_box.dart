import 'package:objectbox/objectbox.dart';

class DatabaseBox<T> implements Box<T> {
  late final Box<T> _box;

  DatabaseBox(Store store) {
    _box = Box(store);
  }

  /// run the query to retrive list data.
  /// example of
  /// condition: T_.brandName.equals('p'))
  List<T> queryMany(QueryBuilder<T> queryBuilder, {
    dynamic orderBy,
    bool descending = false,
  }) {
    if (orderBy != null) queryBuilder.order(orderBy, flags: descending ? 1 : 0);
    final Query<T> query = queryBuilder.build();
    final List<T> result = query.find();
    query.close();
    return result;
  }

  /// run the query to retrive an object.
  /// example of
  /// condition: T_.brandName.equals('p'))
  T? queryOne(QueryBuilder<T> queryBuilder) {
    final Query<T> query = queryBuilder.build();
    final List<T> result = query.find();
    query.close();
    return result.isNotEmpty ? result.first : null;
  }

  @override
  QueryBuilder<T> query([Condition<T>? qc]) => _box.query(qc);

  @override
  bool isEmpty() => _box.isEmpty();

  @override
  bool contains(int id) => _box.contains(id);

  @override
  bool containsMany(List<int> ids) => _box.containsMany(ids);

  @override
  int count({int limit = 0}) => _box.count(limit: limit);

// get
  @override
  T? get(int id) => _box.get(id);

  @override
  List<T> getAll() => _box.getAll();

  T? getLatest(QueryProperty<T, dynamic> property) {
    final Query<T> query =
    (_box.query()
      ..order(property, flags: Order.descending)).build();
    final List<T> result = query.find();
    query.close();
    return result.isNotEmpty ? result.first : null;
  }

  @override
  List<T?> getMany(List<int> ids, {bool growableResult = false}) =>
      _box.getMany(ids, growableResult: growableResult);

// set
  @override
  int put(T object, {PutMode mode = PutMode.put}) =>
      _box.put(object, mode: mode);

  @override
  Future<int> putAsync(T object, {PutMode mode = PutMode.put}) =>
      _box.putAsync(object, mode: mode);

  @override
  List<int> putMany(List<T> objects, {PutMode mode = PutMode.put}) =>
      _box.putMany(objects, mode: mode);

  @override
  int putQueued(T object, {PutMode mode = PutMode.put}) =>
      _box.putQueued(object, mode: mode);

// remove
  @override
  bool remove(int id) => _box.remove(id);

  @override
  int removeAll() => _box.removeAll();

  @override
  int removeMany(List<int> ids) => _box.removeMany(ids);

  @override
  Future<List<T>> getAllAsync() => _box.getAllAsync();

  @override
  Future<T?> getAsync(int id) => _box.getAsync(id);

  @override
  Future<List<T?>> getManyAsync(List<int> ids, {bool growableResult = false}) =>
      _box.getManyAsync(ids, growableResult: growableResult);

  @override
  Future<T> putAndGetAsync(T object, {PutMode mode = PutMode.put}) =>
      _box.putAndGetAsync(object, mode: mode);

  @override
  Future<List<T>> putAndGetManyAsync(List<T> objects,
      {PutMode mode = PutMode.put}) =>
      _box.putAndGetManyAsync(objects, mode: mode);

  @override
  Future<List<int>> putManyAsync(List<T> objects,
      {PutMode mode = PutMode.put}) =>
      _box.putManyAsync(objects, mode: mode);

  @override
  Future<int> putQueuedAwaitResult(T object, {PutMode mode = PutMode.put}) =>
      _box.putAsync(object, mode: mode);

  @override
  Future<int> removeAllAsync() => _box.removeAllAsync();

  @override
  Future<bool> removeAsync(int id) => _box.removeAsync(id);

  @override
  Future<int> removeManyAsync(List<int> ids) => _box.removeManyAsync(ids);
}
