// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardService)
final dashboardServiceProvider = DashboardServiceProvider._();

final class DashboardServiceProvider
    extends
        $FunctionalProvider<
          DashboardService,
          DashboardService,
          DashboardService
        >
    with $Provider<DashboardService> {
  DashboardServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardServiceHash();

  @$internal
  @override
  $ProviderElement<DashboardService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DashboardService create(Ref ref) {
    return dashboardService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardService>(value),
    );
  }
}

String _$dashboardServiceHash() => r'2e1c4e3018424e80b7ee739f37e1d288277b82c8';

@ProviderFor(DashboardDataNotifier)
final dashboardDataProvider = DashboardDataNotifierProvider._();

final class DashboardDataNotifierProvider
    extends $AsyncNotifierProvider<DashboardDataNotifier, DashboardData> {
  DashboardDataNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardDataNotifierHash();

  @$internal
  @override
  DashboardDataNotifier create() => DashboardDataNotifier();
}

String _$dashboardDataNotifierHash() =>
    r'c1cf66d99fe59c774f1f33b6dba973bc04c727e6';

abstract class _$DashboardDataNotifier extends $AsyncNotifier<DashboardData> {
  FutureOr<DashboardData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DashboardData>, DashboardData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DashboardData>, DashboardData>,
              AsyncValue<DashboardData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
