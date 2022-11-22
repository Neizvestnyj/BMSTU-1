
Program ex5;

Type symv = string[1];

Type Char = Object
  Private 
    my_char : symv;
  Public 
    Procedure create(your_char:symv);
    Procedure print();
End;

Procedure Char.create(your_char:symv);
Begin
  my_char := your_char;
End;

Procedure Char.print;
Begin
  writeln(my_char);
End;

Type CharPReal = Object
  Private 
    my_char : Char;
    my_real : real;
  Public 
    Procedure create(your_char : symv; your_real : real);
    Procedure print();
End;

Procedure CharPReal.create(your_char : symv; your_real : real);

Begin
  my_char.create(your_char);
  my_real := your_real;
End;

Procedure CharPReal.print();

Begin
  my_char.print;
  writeln(my_real:3:2);
End;

Var your_CharPReal: CharPReal;
Begin
  your_CharPReal.create('a',1.25);
  your_CharPReal.print;
End.
