import 'package:base_flutter_bloc/l10n/l10n.dart';
import 'package:base_flutter_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MultiBlocListener(
      listeners: [
        /*BlocListener<BlogBloc, BlogState>(
          listener: (context, state) {
            if (state.getBlogStatus.isError) {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: l10n.fetchingFailedPlsTryAgain);
            }
          },
        ),
        BlocListener<BookmarkBloc, BookmarkState>(
          listenWhen: (previous, current) => previous.actionBookmarkStatus != current.actionBookmarkStatus,
          listener: (context, state) {
            if (state.actionBookmarkStatus == ActionBookmarkStatus.addDone) {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                msg: l10n.addedToSavedList,
              );
            }
            if (state.actionBookmarkStatus == ActionBookmarkStatus.removeDone) {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                msg: l10n.removedFromSavedList,
              );
            }
          },
        ),*/
      ],
      child: DismissFocusKeyboard(
        child: Scaffold(
          body: Placeholder(),
        ),
      ),
    );
  }
}
