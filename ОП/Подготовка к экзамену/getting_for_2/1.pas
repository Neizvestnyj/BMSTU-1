
Type square = Object
  a: integer;
  Procedure init(a1:integer);
  Function s(): integer;
  Function p(): integer;
  Function p2(): integer;
End;

Type cube = Object(square)
  Function s(): integer;
  Function p(): integer;
  Function p2(): integer;
  Function v(): integer;
End;

Procedure square.init(a1:integer);
Begin
  a := a1;
End;

Function square.s(): integer;
Begin
  s := self.a * self.a;
End;

Function square.p(): integer;
Begin
  p := self.a * 4;
End;

Function square.p2(): integer;
Begin
  p2 := self.a * 2;
End;

Function cube.s(): integer;
Begin
  s := Inherited s * 6;
End;

Function cube.p(): integer;
Begin
  p := Inherited p * 3;
End;

Function cube.p2(): integer;
Begin
  p2 := Inherited p2 * 3;
End;

Function cube.v(): integer;
Begin
  v := square.s * a;
End;

Var a: cube;
Begin
  a.init(2);
  writeln(a.v);
End.
