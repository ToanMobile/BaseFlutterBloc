import 'package:authentication_repository/data_source/authentication_remote_data_source.dart';
import 'package:base_flutter_bloc/app/app.dart';
import 'package:base_flutter_bloc/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http_client_handler/http_client_handler.dart';
import 'package:injectable/injectable.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => injector.init();

Future<void> initServices() async {
  await Hive.openBox(HiveBox.userPrefs);
  final _bookmarkBox = await Hive.openBox<String>(HiveBox.bookmark);

  injector
    ..registerLazySingleton(
      Client.new,
    )
    ..registerLazySingleton(
      () => HttpClientHandler(
        client: injector<Client>(),
        baseUrl: FlavorConfig.instance.values.baseUrl,
      ),
    )
    /*..registerLazySingleton(
      () => FirebaseStorageService(
        firebaseStorage: FirebaseStorage.instance,
      ),
    )*/
    ..registerLazySingleton(
      () => AuthenticationRemoteDataSource(
        httpClientHandler: injector<HttpClientHandler>(),
      ),
    );
}
