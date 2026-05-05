import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

mixin FetchBlocMixin<E, S extends FetchState> on Bloc<E, S> {
  AppLogger get logger;
  RetryBackoff get backoff;
  String get fetchErrorMessage;
  S withStatus(BlocStatus status);

  bool _hasFetched = false;

  Future<void> runFetch(Emitter<S> emit, Future<S> Function() fetch) async {
    if (_hasFetched) return;
    if (state.blocStatus.isLoading) {
      logger.logDebug('$runtimeType fetch dropped — already loading', tag: runtimeType.toString());
      return;
    }
    emit(withStatus(const BlocStatus.loading()));
    final wait = backoff.wait();
    if (wait != null) await wait;
    try {
      emit(await fetch());
      _hasFetched = true;
      backoff.recordSuccess();
    } catch (e, s) {
      backoff.recordFailure();
      logger.logError(fetchErrorMessage, error: e, stackTrace: s, tag: runtimeType.toString());
      emit(withStatus(BlocStatus.error(
        message: fetchErrorMessage,
        originalError: e,
        stackTrace: s,
      )));
    }
  }
}
