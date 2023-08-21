class PowState{
  final int result;
  final int a;
  final int b;
 PowState({this.result = 0, this.a = 0,this.b = 0});


 PowState copyWith({
   int? a,
   int? b,
   int? result
 }) =>
 
     PowState(
       result: result ?? this.result,
       a: a ?? this.a,
       b: b ?? this.b,
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