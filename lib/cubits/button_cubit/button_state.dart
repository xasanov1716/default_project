class ButtonState {
  bool onChanged;

  ButtonState({this.onChanged = false});

  ButtonState copyWith({
   bool? onChanged,
  }) =>

      ButtonState(
        onChanged: onChanged ?? this.onChanged
      );
}