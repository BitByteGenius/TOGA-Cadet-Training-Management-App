// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotesNotifier)
final notesProvider = NotesNotifierProvider._();

final class NotesNotifierProvider
    extends $NotifierProvider<NotesNotifier, List<StudyNote>> {
  NotesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notesNotifierHash();

  @$internal
  @override
  NotesNotifier create() => NotesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<StudyNote> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StudyNote>>(value),
    );
  }
}

String _$notesNotifierHash() => r'4063914a507a8c7be2c2de8ae1fc3eb9f928eab7';

abstract class _$NotesNotifier extends $Notifier<List<StudyNote>> {
  List<StudyNote> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<StudyNote>, List<StudyNote>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<StudyNote>, List<StudyNote>>,
              List<StudyNote>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
