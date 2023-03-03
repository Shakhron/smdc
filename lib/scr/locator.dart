import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';
import 'package:smdc/scr/data/auth_repository.dart';
import 'package:smdc/scr/utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  Client client = Client();
  client
      .setEndpoint(appWriteEndpoint)
      .setProject(appWriteProjectId)
      .setSelfSigned(status: true);

  locator.registerSingleton<Client>(client);

  locator.registerSingleton(Account(locator<Client>()));

  locator.registerSingleton(AuthRepository());
}
