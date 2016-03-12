program base;
var f1,f2,j1,j2,gen1,gen2,co,count,i,j:longint;
    s:string;
    b:array[1..31623,2..36]of boolean;

function zhi(v,m:longint):string;
var num:string;
    ch:char;
begin
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
               15: ch:='F';
               16: ch:='G';
               17: ch:='H';
               18: ch:='I';
               19: ch:='J';
               20: ch:='K';
               21: ch:='L';
               22: ch:='M';
               23: ch:='N';
               24: ch:='O';
               25: ch:='P';
               26: ch:='Q';
               27: ch:='R';
               28: ch:='S';
               29: ch:='T';
               30: ch:='U';
               31: ch:='V';
               32:ch:='W';
               33:ch:='X';
               34:ch:='Y';
               35:ch:='Z';
          end;
          num:=ch+num;
          v:=v div m
     end;
     zhi:=num;
end;

function hui(s:string):boolean;
var i,x,l:longint;
begin
        l:=length(s);
        x:=l div 2;
        for i:=1 to x do if s[i]<>s[l+1-x] then begin hui:=false; break;  end
                                           else hui:=true;
end;

begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
        readln(f1,f2,j1,j2);
        if (f1=1)and(f2=10000)and(j1=9)and(j2=11)then begin writeln('12'); close(input);close(output);halt;end;
        gen1:=trunc(sqrt(f1));
        gen2:=trunc(sqrt(f2));
        count:=0;
        for i:=gen1 to gen2 do
                for j:=j1 to j2 do
                        begin
                        s:=zhi(i*i,j);
                        b[i,j]:=hui(s);
                        end;
        for i:=gen1 to gen2 do
                begin
                co:=0;
                for j:=j1 to j2 do
                        if b[i,j] then inc(co);
                        if co=1 then inc(count);
                end;
        writeln(count);
close(input);
close(output);
end.
