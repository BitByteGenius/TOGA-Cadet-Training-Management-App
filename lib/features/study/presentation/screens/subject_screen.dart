import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toga/core/constant/app_colors.dart';
import 'package:toga/core/widget/glass_pannel.dart';
import 'package:toga/core/widget/error_view.dart';
import 'package:toga/features/study/data/models/study_subject.dart';
import '../providers/study_provider.dart';

class SubjectsScreen extends ConsumerStatefulWidget {
  const SubjectsScreen({super.key});

  @override
  ConsumerState<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends ConsumerState<SubjectsScreen> {
  String _selectedSubjectId = 'met';

  String _getStatusLabel(SubjectStatus status) {
    switch (status) {
      case SubjectStatus.completed:
        return 'Completed';
      case SubjectStatus.inProgress:
        return 'In Progress';
      case SubjectStatus.notStarted:
        return 'Not Started';
    }
  }

  @override
  Widget build(BuildContext context) {
    final subjectsAsync = ref.watch(subjectsListProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('COCKPIT GROUND SCHOOL'),
        actions: [
          IconButton(
            icon: const Icon(Icons.rate_review_outlined, color: AppColors.neonBlue),
            onPressed: () => context.push('/notes'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.7, -0.6),
            radius: 1.2,
            colors: [Color(0x1500E5FF), Colors.transparent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: subjectsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.neonBlue)),
            error: (err, _) => ErrorView(
              message: 'Failed to load subjects: $err',
              onRetry: () => ref.read(subjectsListProvider .notifier).refresh(),
            ),
            data: (subjects) {
              if (subjects.isNotEmpty && !subjects.any((s) => s.id == _selectedSubjectId)) {
                _selectedSubjectId = subjects.first.id;
              }

              final selectedSubject = subjects.firstWhere(
                (s) => s.id == _selectedSubjectId,
                orElse: () => subjects.first,
              );

              return LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = constraints.maxWidth > 650;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column: Subject Selector Layout Engine
                      Expanded(
                        flex: isTablet ? 2 : 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'FLIGHT TRAINING SCHEMATIC',
                              style: TextStyle(color: AppColors.textMuted, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                            ),
                            const SizedBox(height: 16),
                            
                            Expanded(
                              child: ListView.builder(
                                itemCount: subjects.length,
                                itemBuilder: (context, index) {
                                  final subject = subjects[index];
                                  final isSelected = _selectedSubjectId == subject.id;
                                  
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    child: GestureDetector(
                                      onTap: () => setState(() => _selectedSubjectId = subject.id),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          boxShadow: isSelected ? [BoxShadow(color: AppColors.neonBlue.withValues(alpha: 0.15), blurRadius: 12)] : [],
                                        ),
                                        child: GlassPanel(
                                          blur: isSelected ? 30 : 10,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(subject.subjectName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                  _buildInstrumentBadge(_getStatusLabel(subject.status)),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${subject.lessonsCompleted}/${subject.totalLessons} Modules', style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                                                  Text('${subject.progressPercentage}%', style: TextStyle(color: isSelected ? AppColors.neonBlue : Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              LinearProgressIndicator(
                                                value: subject.progressPercentage / 100.0,
                                                backgroundColor: Colors.white10,
                                                color: subject.status == SubjectStatus.completed ? AppColors.cyberTeal : AppColors.neonBlue,
                                                minHeight: 2,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right Column (Conditional Tablet Mode): Splitting details into an independent panel side-by-side
                      if (isTablet) ...[
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUB-MODULE LEVEL MATRIX — ${selectedSubject.subjectName.toUpperCase()}',
                                style: const TextStyle(color: AppColors.textMuted, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: ref.watch(chaptersListProvider(_selectedSubjectId)).when(
                                  loading: () => const Center(child: CircularProgressIndicator(color: AppColors.neonBlue)),
                                  error: (err, _) => ErrorView(
                                    message: 'Failed to load chapters: $err',
                                    onRetry: () => ref.read(chaptersListProvider (_selectedSubjectId).notifier).refresh(_selectedSubjectId),
                                  ),
                                  data: (chapters) => GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 14,
                                      mainAxisSpacing: 14,
                                      childAspectRatio: 1.6,
                                    ),
                                    itemCount: chapters.length,
                                    itemBuilder: (context, index) {
                                      final chapter = chapters[index];
                                      return GlassPanel(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('0${index + 1}', style: const TextStyle(color: AppColors.neonBlue, fontWeight: FontWeight.bold, fontSize: 14)),
                                                Icon(
                                                  chapter.isCompleted ? Icons.check_circle_outline : Icons.arrow_right_alt,
                                                  color: chapter.isCompleted ? AppColors.cyberTeal : AppColors.textMuted,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              chapter.chapterName,
                                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, height: 1.3),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInstrumentBadge(String status) {
    Color statusColor;
    switch (status) {
      case 'Completed':
        statusColor = AppColors.cyberTeal;
        break;
      case 'In Progress':
        statusColor = AppColors.warningOrange;
        break;
      default:
        statusColor = AppColors.textMuted;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: statusColor.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 4, height: 4, decoration: BoxDecoration(shape: BoxShape.circle, color: statusColor)),
          const SizedBox(width: 6),
          Text(
            status.toUpperCase(),
            style: TextStyle(color: statusColor, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }
}