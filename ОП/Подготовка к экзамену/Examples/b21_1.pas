
Type mas = array[1..10] Of integer;

Type action = Procedure (Var sp :mas);

Procedure init(Var sp :mas);
far;

Var i : integer;
Begin
  randomize;
  For i := 1 To 10 Do
    sp[i] := random(2000) - 1000;
End;

Procedure show(Var sp :mas);
far;

Var i : integer;
Begin
  randomize;
  write('[');
  For i := 1 To 9 Do
    write(sp[i], ', ');
  write(sp[i], ']');
End;

Procedure menu(Var m : mas; proc : action);
Begin
  proc(m);
End;

Var m : mas;
Begin
  menu(m, init);
  menu(m, show);
End.
