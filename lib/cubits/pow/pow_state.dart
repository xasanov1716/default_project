class PowState{
  final int result;
 PowState({this.result = 0});


 PowState copyWith({
   int? a,
   int? b,
   int? result
 }) =>
 
     PowState(
       result: result ?? this.result,
     );

 factory PowState.fromJson(Map<String, dynamic> json) => PowState(
   result: json["result"] as int? ?? 0,
 );

 @override
 String toString() {
   return '''

    result:$result
    ''';
 }
}