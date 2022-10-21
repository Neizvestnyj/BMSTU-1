Function ye(b:integer): integer;
Begin
  ye := b;
End;

Var a: integer;

Function ne(): integer;
Begin
  ne := a;
End;

Begin
  a := 1;
  writeln(ye(a));
  writeln(ne());
End.
