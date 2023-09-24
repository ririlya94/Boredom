import 'package:boredom/network/network.repository.dart';
import 'package:boredom/utilities/database/database.repository.dart';
import 'package:boredom/utilities/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<Services> service = Provider<Services>((ref) {
  return Services(
      network: ref.read(networkRepository),
      database: ref.read(databaseRepository)
  );
});

final Provider<NetworkRepository> networkRepository = Provider<NetworkRepository>((_) {
  return NetworkRepository();
});

final Provider<DatabaseRepository> databaseRepository =
Provider<DatabaseRepository>((_) {
  return DatabaseRepository();
});