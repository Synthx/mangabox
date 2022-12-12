import 'package:freezed_annotation/freezed_annotation.dart';

enum EditionStatus {
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('STOPPED')
  stopped,
  @JsonValue('FINISHED')
  finished,
}

extension EditionStatusExtension on EditionStatus {
  String locale() {
    switch (this) {
      case EditionStatus.inProgress:
        return 'En cours de parution';
      case EditionStatus.stopped:
        return 'Edition arrêtée';
      case EditionStatus.finished:
        return 'Edition terminée';
    }
  }
}
