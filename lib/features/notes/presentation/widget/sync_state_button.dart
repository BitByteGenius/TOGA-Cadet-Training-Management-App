import 'package:flutter/material.dart';
import 'package:toga/core/constant/app_colors.dart';
import 'package:toga/features/notes/data/models/study_note.dart';

class SyncStateButton extends StatelessWidget {
  final SyncStatus status;
  final VoidCallback onPressed;

  const SyncStateButton({
    super.key,
    required this.status,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: _buildButtonForStatus(),
    );
  }

  Widget _buildButtonForStatus() {
    switch (status) {
      case SyncStatus.pendingSync:
        return ElevatedButton.icon(
          key: const ValueKey('pending'),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.warningOrange),
          onPressed: onPressed,
          icon: const Icon(Icons.cloud_upload_outlined, size: 16),
          label: const Text('SYNC TO BACKEND', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        );
      case SyncStatus.syncing:
        return Container(
          key: const ValueKey('syncing'),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neonBlue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.neonBlue),
          ),
        );
      case SyncStatus.synced:
        return Container(
          key: const ValueKey('synced'),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.cyberTeal.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, color: AppColors.cyberTeal, size: 16),
              SizedBox(width: 6),
              Text('CLOUD SYNCED', style: TextStyle(color: AppColors.cyberTeal, fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      case SyncStatus.failed:
        return ElevatedButton.icon(
          key: const ValueKey('failed'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          onPressed: onPressed,
          icon: const Icon(Icons.sync_problem, size: 16),
          label: const Text('RETRY SYNC', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        );
    }
  }
}