import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/util/log_utils.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    LogUtil.log('[Provider] Add ${provider.name ?? provider.runtimeType}');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    LogUtil.log('[Provider] Fail ${this.runtimeType}');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    LogUtil.log('[Provider] Update ${this.runtimeType}');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    LogUtil.log('[Provider] Dispose ${this.runtimeType}');
  }
}
