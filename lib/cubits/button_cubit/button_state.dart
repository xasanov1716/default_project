class TaskState{
  TaskState({required this.currentState});
  final bool currentState;

  TaskState copyWith({
    bool? currentState,

  }) =>
      TaskState(
          currentState: currentState ?? this.currentState
      );
}