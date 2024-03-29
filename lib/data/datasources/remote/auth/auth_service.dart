import 'package:base_flutter_bloc/data/datasources/remote/auth/requests/login_request_body.dart';
import 'package:base_flutter_bloc/data/datasources/remote/auth/requests/register_request_body.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import 'responses/login_response.dart';

part 'auth_service.chopper.dart';

@lazySingleton
@ChopperApi(baseUrl: 'api/auth')
abstract class AuthService extends ChopperService {
  @factoryMethod
  static AuthService create(@Named('unAuthClient') ChopperClient client) {
    return _$AuthService(client);
  }

  @Post(path: 'login')
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @Post(path: 'register')
  Future<void> register(@Body() RegisterRequestBody body);
}
