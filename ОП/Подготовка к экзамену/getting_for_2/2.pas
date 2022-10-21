
Uses crt;

Type item = Object
  name: string[100];
  strength: integer;
  expirienceofup: integer;
  expirience: integer;
  costofup: integer;
  costinshop: integer;
  prototype: integer;
End;

Type game = Object
  money: double;
  inventory: array [0..63] Of item;
  shop: array [0..4] Of item;
  sp: Longint;
  constructor Create();
  Procedure menu;
  Procedure printinventory;
  Procedure printshop;
  Procedure buy(noitem:integer);
  Procedure getexp(noitem1, noitem2:integer);
  Procedure delitem(noitem:integer);
  Procedure up(noitem:integer);
  Function getitem(noitem:integer): item;
End;

Procedure game.menu;

Var poz, poz2: integer;
  abc: string[5];
Begin
  clrscr;
  textcolor(white);
  writeln('--- Главное меню ---');
  Writeln;
  writeln('Выбери одну из позиций');
  writeln;
  textcolor(green);
  writeln('1 -- В магазин');
  writeln('2 -- В инвентарь');
  writeln('3 -- На работу');
  textcolor(red);
  writeln('100 -- Выход');
  textcolor(white);
  writeln;
  readln(poz);
  clrscr;
  Case poz Of 
    1:
       Begin
         While poz <> 100 Do
           Begin
             writeln('--- Магазин ---');
             Writeln;
             writeln('Для выхода наберите 100');
             writeln('Вот весь доступный ассортимент'
             );
             writeln;
             self.printshop;
             writeln;
             textcolor(green);
             writeln('Ваш баланс ', money:10:2);
             textcolor(white);
             writeln;
             write('Я хочу купить продукт номер: ');
             readln(poz);
             If poz < 5 Then buy(poz);
           End;
         self.menu;
       End;
    2:
       Begin
         While poz <> 100 Do
           Begin
             writeln('--- Инвентарь ---');
             Writeln;
             writeln('Для выхода наберите 100');
             writeln;
             self.printinventory;
             writeln;
             textcolor(green);
             writeln(
                     'Для обьединения '+
                     'введите 2 номера предмета'
             );
             writeln('Для улучшения ' +
                     'введите номер предмета');
             textcolor(white);
             readln(poz);
             If poz <> 100 Then
               Begin
                 If inventory[poz - 1].expirience >=
                    inventory[poz - 1].expirienceofup Then
                   self.up(poz - 1)
                 Else
                   Begin
                     readln(poz2);
                     self.getexp(poz-1, poz2-1);
                   End;
               End;
           End;
       End;
    3:
       Begin

         While abc <> '100' Do
           Begin
             clrscr;
             writeln('--- Работа ---');
             Writeln;
             writeln('Зарабатывайте кликая');
             textcolor(blue);
             Writeln('Ваш коэффициент ', sp);
             textcolor(white);
             writeln('Наберите 100 для выхода');
             textcolor(green);
             writeln(
                     'Увеличение коэффициента стоит '
                     , sp * sqrt(sp): 9: 2);
             writeln(
                     'Если хотите увеличить нажмите 1'
             );
             textcolor(white);
             write('Ваш баланс ');
             write(money:10:2,' ');
             readln(abc);
             If abc = '1' Then
               If money > sp * sqrt(sp) Then
                 Begin
                   money := money - sp * sqrt(sp);
                   sp := sp * 2;
                 End;
             money := money + 0.01 * sp;
           End;
         self.menu;
       End;
    339: money := 10000;
    100:
         Begin
           writeln('Вы точно хотите выйти?');
           textcolor(red);
           writeln('Данные будут удалены');
           textcolor(white);
           writeln;
           writeln('Если вы согласны наберите 100');
           readln(poz);
           If poz = 100 Then exit()
           Else self.menu;
         End;
  End;
  self.menu;
End;

Function game.getitem(noitem:integer): item;
Begin
  Case noitem Of 
    0:
       Begin
         getitem.name := 'Деревянный меч';
         getitem.strength := 1;
         getitem.expirienceofup := 3;
         getitem.expirience := 1;
         getitem.costofup := 10;
         getitem.costinshop := 40;
         getitem.prototype := 0;
       End;
    1:
       Begin
         getitem.name := 'Каменный меч';
         getitem.strength := 2;
         getitem.expirienceofup := 6;
         getitem.expirience := 1;
         getitem.costofup := 20;
         getitem.costinshop := 240;
         getitem.prototype := 1;
       End;
    2:
       Begin
         getitem.name := 'Железный меч';
         getitem.strength := 4;
         getitem.expirienceofup := 12;
         getitem.expirience := 1;
         getitem.costofup := 40;
         getitem.costinshop := 1440;
         getitem.prototype := 2;
       End;
    3:
       Begin
         getitem.name := 'Золотой меч';
         getitem.strength := 8;
         getitem.expirienceofup := 24;
         getitem.expirience := 1;
         getitem.costofup := 80;
         getitem.costinshop := 17280;
         getitem.prototype := 3;
       End;
    4:
       Begin
         getitem.name := 'Алмазный меч';
         getitem.strength := 16;
         getitem.expirienceofup := 10000;
         getitem.expirience := 1;
         getitem.costofup := 10000;
         getitem.costinshop := 414720;
         getitem.prototype := 4;
       End;
  End;
End;

constructor game.Create();

Var i: integer;
Begin
  For i:=0 To 63 Do
    inventory[i].name := '-';
  money := 0;
  sp := 1;
  For i:=0 To 4 Do
    shop[i] := getitem(i);
End;

Procedure game.printinventory;

Var i: integer;
Begin
  i := 0;
  While (i <> 63) And (inventory[i].name <> '-') Do
    Begin
      textcolor(green);
      Writeln('Предмет ', i + 1);
      Writeln('Имя: ', inventory[i].name, ' ');
      textcolor(white);
      Writeln('Сила: ', inventory[i].strength, ' ');
      If inventory[i].expirience = inventory[i].expirienceofup Then
        textcolor(green)
      Else
        textcolor(blue);
      Writeln('Опыт: ', inventory[i].expirience, '/',
              inventory[i].expirienceofup);
      textcolor(white);
      Writeln('Денег для повышения: ', inventory[i].costofup)
      ;
      Writeln;
      i := i + 1;
    End;
End;

Procedure game.printshop;

Var i: integer;
Begin
  i := 0;
  While (i <> 5) And (shop[i].costinshop <= money) Do
    Begin
      textcolor(green);
      Writeln('Предмет ', i + 1);
      Writeln('Имя: ', shop[i].name, ' ');
      textcolor(white);
      Writeln('Сила: ', shop[i].strength, ' ');
      Writeln('Опыт для повышения: ', shop[i].
              expirienceofup);
      textcolor(blue);
      Writeln('Стоимость: ', shop[i].costinshop);
      textcolor(white);
      Writeln;
      i := i + 1;
    End;
End;

Procedure game.buy(noitem:integer);

Var itm: item;
  i: integer;
Begin
  i := 0;
  itm := getitem(noitem - 1);
  If (money - itm.costinshop) > 0 Then
    Begin
      money := money - itm.costinshop;
      While (i <> 63) And (inventory[i].name <> '-') Do
        i := i + 1;
      inventory[i] := itm;
      sp := sp + 1;
    End;
End;

Procedure game.delitem(noitem:integer);

Var i: integer;
Begin
  i := noitem;
  While i <> 63 Do
    Begin
      inventory[i] := inventory[i + 1];
      i := i + 1;
    End
End;

Procedure game.getexp(noitem1, noitem2:integer);

Begin
  If inventory[noitem1].prototype = inventory[noitem2].prototype Then
    Begin
      inventory[noitem1].expirience := inventory[noitem1].expirience +
                                       inventory[noitem2].expirience;
      delitem(noitem2);
    End;
End;
Procedure game.up(noitem:integer);

Begin
  If inventory[noitem].name <> '-' Then
    If inventory[noitem].expirience >= inventory[noitem].expirienceofup Then
      inventory[noitem] := getitem(inventory[noitem].prototype + 1);
End;

Var gm: game;
Begin
  gm.create;
  gm.menu;
End.
