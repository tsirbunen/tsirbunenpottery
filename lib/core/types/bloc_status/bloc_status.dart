enum Status {
  error,
  loading,
  ok,
  success,
}

class BlocStatus {
  final Status status;
  final String? message;
  final Object? originalError;
  final StackTrace? stackTrace;

  const BlocStatus._({
    required this.status,
    this.message,
    this.originalError,
    this.stackTrace,
  });

  const BlocStatus.ok() : this._(status: Status.ok);
  const BlocStatus.loading() : this._(status: Status.loading);
  const BlocStatus.success() : this._(status: Status.success);
  const BlocStatus.error({
    required String message,
    Object? originalError,
    StackTrace? stackTrace,
  }) : this._(
          status: Status.error,
          message: message,
          originalError: originalError,
          stackTrace: stackTrace,
        );

  bool get isLoading => status == Status.loading;
  bool get isError => status == Status.error;
  bool get isOk => status == Status.ok;
  bool get isSuccess => status == Status.success;
}
