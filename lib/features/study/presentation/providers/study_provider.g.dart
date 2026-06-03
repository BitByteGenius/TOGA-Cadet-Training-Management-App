// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(studyService)
final studyServiceProvider = StudyServiceProvider._();

final class StudyServiceProvider
    extends $FunctionalProvider<StudyService, StudyService, StudyService>
    with $Provider<StudyService> {
  StudyServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studyServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studyServiceHash();

  @$internal
  @override
  $ProviderElement<StudyService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StudyService create(Ref ref) {
    return studyService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StudyService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StudyService>(value),
    );
  }
}

String _$studyServiceHash() => r'efdaedc5a4f17927deb372a04abb31127a8f15ea';

@ProviderFor(SubjectsListNotifier)
final subjectsListProvider = SubjectsListNotifierProvider._();

final class SubjectsListNotifierProvider
    extends $AsyncNotifierProvider<SubjectsListNotifier, List<StudySubject>> {
  SubjectsListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subjectsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subjectsListNotifierHash();

  @$internal
  @override
  SubjectsListNotifier create() => SubjectsListNotifier();
}

String _$subjectsListNotifierHash() =>
    r'5c06a772e13bc4aba4f5d8448b1db14580d4b642';

abstract class _$SubjectsListNotifier
    extends $AsyncNotifier<List<StudySubject>> {
  FutureOr<List<StudySubject>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<StudySubject>>, List<StudySubject>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<StudySubject>>, List<StudySubject>>,
              AsyncValue<List<StudySubject>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ChaptersListNotifier)
final chaptersListProvider = ChaptersListNotifierFamily._();

final class ChaptersListNotifierProvider
    extends $AsyncNotifierProvider<ChaptersListNotifier, List<Chapter>> {
  ChaptersListNotifierProvider._({
    required ChaptersListNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chaptersListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chaptersListNotifierHash();

  @override
  String toString() {
    return r'chaptersListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChaptersListNotifier create() => ChaptersListNotifier();

  @override
  bool operator ==(Object other) {
    return other is ChaptersListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chaptersListNotifierHash() =>
    r'dcf8e828c90d62bb44ba39f17814c5e04a0c0d3a';

final class ChaptersListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ChaptersListNotifier,
          AsyncValue<List<Chapter>>,
          List<Chapter>,
          FutureOr<List<Chapter>>,
          String
        > {
  ChaptersListNotifierFamily._()
    : super(
        retry: null,
        name: r'chaptersListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChaptersListNotifierProvider call(String subjectId) =>
      ChaptersListNotifierProvider._(argument: subjectId, from: this);

  @override
  String toString() => r'chaptersListProvider';
}

abstract class _$ChaptersListNotifier extends $AsyncNotifier<List<Chapter>> {
  late final _$args = ref.$arg as String;
  String get subjectId => _$args;

  FutureOr<List<Chapter>> build(String subjectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Chapter>>, List<Chapter>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Chapter>>, List<Chapter>>,
              AsyncValue<List<Chapter>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
