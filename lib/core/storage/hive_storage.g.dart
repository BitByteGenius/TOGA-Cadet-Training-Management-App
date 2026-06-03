// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageService)
final storageServiceProvider = StorageServiceProvider._();

final class StorageServiceProvider
    extends
        $FunctionalProvider<
          HiveStorageService,
          HiveStorageService,
          HiveStorageService
        >
    with $Provider<HiveStorageService> {
  StorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageServiceHash();

  @$internal
  @override
  $ProviderElement<HiveStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HiveStorageService create(Ref ref) {
    return storageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HiveStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HiveStorageService>(value),
    );
  }
}

String _$storageServiceHash() => r'f2f3d858cb9f2dd29105208156be6c2b533c8fec';
