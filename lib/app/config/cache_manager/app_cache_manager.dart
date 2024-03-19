import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart';

import '../../../di/di.dart';

class AppCacheManager {
  static const cacheKey = 'image_cached';
  static final customCacheManager = CacheManager(
    Config(
      cacheKey,
      stalePeriod: const Duration(days: 2),
      maxNrOfCacheObjects: 75,
      repo: JsonCacheInfoRepository(databaseName: cacheKey),
      fileService: HttpFileService(httpClient: injector<Client>()),
    ),
  );
}
