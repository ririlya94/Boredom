import 'dart:async';

import 'package:boredom/enum/enum.logger.dart';
import 'package:boredom/enum/enum.viewstate.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ViewBaseController extends Notifier<ViewState> {
  String? errorMsg;

  @override
  ViewState build() => ViewState.initial;

  @override
  bool updateShouldNotify(ViewState previous, ViewState next) =>
      previous != next;

  bool get inAsyncCall => state == ViewState.inAsyncCall;

  bool get isDeleting => state == ViewState.deleting;

  bool get isInitial => state == ViewState.initial;

  bool get isLoaded => state == ViewState.loaded;

  bool get isLoading => state == ViewState.loading;

  bool get isSubmitting => state == ViewState.submitting;

  bool get isError => state == ViewState.error;

  void setInAsyncCall() => state = ViewState.inAsyncCall;

  void setDeleting() => state = ViewState.deleting;

  void setInitial() => state = ViewState.initial;

  void setLoaded() => state = ViewState.loaded;

  void setLoading() => state = ViewState.loading;

  void setSubmitting() => state = ViewState.submitting;

  void setError(dynamic error,
      dynamic stacktrace, {
        FutureOr? action,
        String? title,
        String? subtitle,
        bool noPopup = false,
      }) {
    AppLog.print(error, level: LoggerLevel.error);

    // if (state != ViewState.error) {
    //   if (error is NetworkException) {
    //     errorMsg = error.message;
    //     title = title ?? error.title;
    //     subtitle = subtitle ?? error.message;
    //
    //     if (error.isKickout) {
    //       ref.read(service).cancelApiRequests();
    //       action = () => ref.read(service).logout();
    //     } else {
    //       state = ViewState.error;
    //     }
    //   } else {
    //     state = ViewState.error;
    //     errorMsg = error?.toString();
    //     title = title ?? getLocalization.error;
    //     subtitle = subtitle ?? error?.toString();
    //   }
    //
    //   if (!noPopup) {
    //     showErrorDialog(
    //       title: title,
    //       subtitle: subtitle,
    //       action: action,
    //     );
    //   }
    // }
  }
}

/// For reusable Notifier Provider
/// So when any notifier provider is called, it will auto refresh/reset the whole
/// provider/controller
abstract class BaseControllerAutoDispose
    extends AutoDisposeNotifier<ViewState> {
  String? errorMsg;

  @override
  ViewState build() => ViewState.initial;

  @override
  bool updateShouldNotify(ViewState previous, ViewState next) =>
      previous != next;

  bool get inAsyncCall => state == ViewState.inAsyncCall;

  bool get isDeleting => state == ViewState.deleting;

  bool get isInitial => state == ViewState.initial;

  bool get isLoaded => state == ViewState.loaded;

  bool get isLoading => state == ViewState.loading;

  bool get isSubmitting => state == ViewState.submitting;

  bool get isError => state == ViewState.error;

  void setInAsyncCall() => state = ViewState.inAsyncCall;

  void setDeleting() => state = ViewState.deleting;

  void setInitial() => state = ViewState.initial;

  void setLoaded() => state = ViewState.loaded;

  void setLoading() => state = ViewState.loading;

  void setSubmitting() => state = ViewState.submitting;

  void setError(dynamic error,
      dynamic stacktrace, {
        FutureOr? action,
        String? title,
        String? subtitle,
        bool noPopup = false,
      }) {
    AppLog.print(error, level: LoggerLevel.error);

    // if (state != ViewState.error) {
    //   if (error is NetworkException) {
    //     errorMsg = error.message;
    //     title = title ?? error.title;
    //     subtitle = subtitle ?? error.message;
    //
    //     if (error.isKickout) {
    //       ref.read(service).cancelApiRequests();
    //       action = () => ref.read(service).logout();
    //     } else {
    //       state = ViewState.error;
    //     }
    //   } else {
    //     state = ViewState.error;
    //     errorMsg = error?.toString();
    //     title = title ?? getLocalization.error;
    //     subtitle = subtitle ?? error?.toString();
    //   }
    //
    //   if (!noPopup) {
    //     showErrorDialog(
    //       title: title,
    //       subtitle: subtitle,
    //       action: action,
    //     );
    //   }
    // }
  }
}