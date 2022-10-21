
Type exz = Object
  name: string[20];
  point: smallint;
  Procedure init(nm:String; pnt:smallint);
  Procedure print;
  Procedure pre(newpnt:smallint);
  Function zname: string;
  Function zpoint: smallint;
End;

Type zachbook = Object
  id: smallint;
  fam: string[20];
  noexz: smallint;
  masexz: array Of exz;
  Procedure init(idz:smallint;famil:String;nexz:smallint);
  Procedure inf;
  Procedure per(no, bal:smallint);
  Function point: real;
  Function canget: boolean;
End;

Procedure exz.init(nm:String; pnt:smallint);
Begin
  name := nm;
  point := pnt;
End;

Procedure exz.print;
Begin
  writeln(name);
  writeln(point);
End;

Procedure exz.pre(newpnt:smallint);
Begin
  point := newpnt;
End;

Function exz.zname: string;
Begin
  zname := name;
End;

Function exz.zpoint: smallint;
Begin
  zpoint := point;
End;


Procedure zachbook.init(
                        idz:smallint;
                        famil:String;
                        nexz:smallint);

Var i: integer;
Begin
  id := idz;
  fam := famil;
  noexz := nexz;
  setlength(masexz, nexz);
  For i := 0 To nexz Do
    Begin
      readln(masexz[i].name);
      readln(masexz[i].point);
    End;
End;
Procedure zachbook.inf;

Var i: integer;
Begin
  writeln(id);
  writeln(fam);
  writeln(noexz);
  For i := 0 To noexz Do
    Begin
      writeln(masexz[i].name);
      writeln(masexz[i].point);
    End;
End;

Procedure zachbook.per(no, bal:smallint);
Begin
  masexz[no].point := bal;
End;

Function zachbook.point: real;

Var i, t: integer;
Begin
  For i := 0 To noexz Do
    t := t + masexz[i].point;
  point := t / noexz;
End;

Function zachbook.canget: boolean;

Var i, t: integer;
Begin
  For i := 0 To noexz Do
    If masexz[i].point = 5 Then t := t + 1;
  canget := t >= (noexz - 1);
End;

Var a: zachbook;
Begin
  a.init(11,'plutto',3);
  a.inf;
End.
