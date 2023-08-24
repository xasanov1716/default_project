class PowState{
  final String result;
  final double a;
  final double b;
 PowState({this.result = '', this.a = 0.0,this.b = 0.0});


 PowState copyWith({
   double? a,
   double? b,
   String? result
 }) =>
 
     PowState(
       result: result ?? this.result,
       a: a ?? this.a,
       b: b ?? this.b,
     );

 factory PowState.fromJson(Map<String, dynamic> json) => PowState(
   result: json["result"] as String? ?? '',
 );

 @override
 String toString() {
   return '''
  
    result:$result
    ''';
 }
}