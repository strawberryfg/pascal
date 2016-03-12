var i,m,n,v,t:longint;
    
    ch:char;
    num:string;
function change(k:string,m:integer):string;
begin
     v:=0;
     for i:=1 to length(num) do
     begin
          case num[i] of
               '0': t:=0;
               '1': t:=1;
               '2': t:=2;
               '3': t:=3;
               '4': t:=4;
               '5': t:=5;
               '6': t:=6;
               '7': t:=7;
               '8': t:=8;
               '9': t:=9;
               'A': t:=10;
               'B': t:=11;
               'C': t:=12;
               'D': t:=13;
               'E': t:=14;
               'F': t:=15
          end;
          v:=v*10+t
     end;
     num:='';
     while v<>0 do
     begin
          case v mod m of
               0: ch:='0';
               1: ch:='1';
               2: ch:='2';
               3: ch:='3';
               4: ch:='4';
               5: ch:='5';
               6: ch:='6';
               7: ch:='7';
               8: ch:='8';
               9: ch:='9';
               10: ch:='A';
               11: ch:='B';
               12: ch:='C';
               13: ch:='D';
               14: ch:='E';
               15: ch:='F'
          end;
          num:=ch+num;
          v:=v div m
   change:=num;  
end;
begin
     assign(input,'base.in');
     reset(input);
     assign(output,'base.out');
     rewrite(output);
     read(a1);
     read(a2);
     read(b1);
     read(b2);
     for i:= a1 to a2 do 
       begin
          c1[i]:=change(i,b1);
          c2[i]:=change(i,b2);
       end;
     for i:=a1 to a2 do 
       for j:=1 to length(c1[i])do
        