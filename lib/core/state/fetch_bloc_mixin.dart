import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/state/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

mixin FetchBlocMixin<E, S extends FetchState> on Bloc<E, S> {
  AppLogger get logger;
  bool get isLoaded;
  String get fetchErrorMessage;
  S withStatus(BlocStatus status);

  final _backoff = RetryBackoff();

  Future<void> runFetch(Emitter<S> emit, Future<S> Function() fetch) async {
    if (state.blocStatus.isLoading || isLoaded) return;
    emit(withStatus(const BlocStatus(Status.loading)));
    final wait = _backoff.wait();
    if (wait != null) await wait;
    try {
      emit(await fetch());
      _backoff.recordSuccess();
    } catch (e, s) {
      _backoff.recordFailure();
      logger.logError(fetchErrorMessage, error: e, stackTrace: s, tag: runtimeType.toString());
      emit(withStatus(BlocStatus(Status.error, message: e.toString())));
    }
  }
}
