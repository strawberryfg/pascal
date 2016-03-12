var  b:array[1..10000] of boolean;
     i,k,o,m:longint;
     s:string;
begin
     assign(input,'josepous.in');
     reset(input);
     assign(output,'josepous.out');
     rewrite(output);
     readln(k);
     for i:=1 to k do
     begin
     b[i]:=true;
     end;
     o:=30;
     while o<>0 do
     if o mod 2=0 then
     begin
     for i:=1 to k do
     begin
     s:=s+0;
     end;
     dec(o);
     end
     else
     begin
     for i:=1 to k do
     begin
     s:=s+1;
     end;
     dec(o);
     end;
     for m:=1 to 2*k do
        for i:=1 to k do
     begin
     if pos(s,m*k,1)=0 then b[m]:=false;
     end;
     for m:=1 to 2*k do
     begin
     writeln (m);
     break;
     end;
     close(input);
     close(output);
end.
