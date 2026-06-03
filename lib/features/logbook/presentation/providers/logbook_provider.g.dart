// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logbook_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logbookService)
final logbookServiceProvider = LogbookServiceProvider._();

final class LogbookServiceProvider
    extends $FunctionalProvider<LogbookService, LogbookService, LogbookService>
    with $Provider<LogbookService> {
  LogbookServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logbookServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logbookServiceHash();

  @$internal
  @override
  $ProviderElement<LogbookService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogbookService create(Ref ref) {
    return logbookService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogbookService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogbookService>(value),
    );
  }
}

String _$logbookServiceHash() => r'16b302f382ccf4c9714d3216d5696980f32f6ff4';

@ProviderFor(LogbookEntriesNotifier)
final logbookEntriesProvider = LogbookEntriesNotifierProvider._();

final class LogbookEntriesNotifierProvider
    extends $AsyncNotifierProvider<LogbookEntriesNotifier, List<LogbookEntry>> {
  LogbookEntriesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logbookEntriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logbookEntriesNotifierHash();

  @$internal
  @override
  LogbookEntriesNotifier create() => LogbookEntriesNotifier();
}

String _$logbookEntriesNotifierHash() =>
    r'b4180c4ce98cdf545b6c9ebc1ae207553d1eac16';

abstract class _$LogbookEntriesNotifier
    extends $AsyncNotifier<List<LogbookEntry>> {
  FutureOr<List<LogbookEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<LogbookEntry>>, List<LogbookEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LogbookEntry>>, List<LogbookEntry>>,
              AsyncValue<List<LogbookEntry>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
