// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:authentication_repository/data_source/authentication_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:base_flutter_bloc/app/app.dart';
import 'package:base_flutter_bloc/authentication/authentication.dart';
import 'package:base_flutter_bloc/di/di.dart';
import 'package:base_flutter_bloc/l10n/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => AuthenticationRepository(
            dataSource: injector<AuthenticationRemoteDataSource>(),
          ),
        ),
        /*RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(
            userDataSource: injector<UserRemoteDataSource>(),
            firebaseStorageService: injector<FirebaseStorageService>(),
          ),
        ),
        RepositoryProvider<BlogRepository>(
          create: (_) => BlogRepository(
            remoteDataSource: injector<BlogRemoteDataSource>(),
            firebaseStorageSerivce: injector<FirebaseStorageService>(),
          ),
        ),
        RepositoryProvider<BookmarkRepository>(
          create: (_) => BookmarkRepository(
            localDataSource: injector<BookmarkLocalDataSource>(),
            remoteDataSource: injector<BookmarkRemoteDataSource>(),
          ),
        ),*/
      ],
      child: const VeryGoodBlogAppView(),
    );
  }
}

class VeryGoodBlogAppView extends StatefulWidget {
  const VeryGoodBlogAppView({super.key});

  @override
  State<VeryGoodBlogAppView> createState() => _VeryGoodBlogAppViewState();
}

class _VeryGoodBlogAppViewState extends State<VeryGoodBlogAppView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Very Good Blog App',
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRoutes.route.routeInformationProvider,
        routeInformationParser: AppRoutes.route.routeInformationParser,
        routerDelegate: AppRoutes.route.routerDelegate,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: FontFamily.nunito,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          primaryColorDark: AppPalette.primaryColor,
          primaryColor: AppPalette.primaryColor,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppPalette.primaryColor,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
