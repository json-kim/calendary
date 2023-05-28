import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/util/log_utils.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final arg = provider.argument;
    final argText = arg == null ? '' : '($arg)';

    LogUtil.log(
        '[Provider] Add ${provider.name ?? provider.runtimeType}$argText');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final arg = provider.argument;
    final argText = arg == null ? '' : '($arg)';

    LogUtil.log(
        '[Provider] Fail ${provider.name ?? provider.runtimeType}$argText');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final arg = provider.argument;
    final argText = arg == null ? '' : '($arg)';

    LogUtil.log(
        '[Provider] Update ${provider.name ?? provider.runtimeType}$argText');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final arg = provider.argument;
    final argText = arg == null ? '' : '($arg)';

    LogUtil.log(
        '[Provider] Dispose ${provider.name ?? provider.runtimeType}$argText');
  }
}
