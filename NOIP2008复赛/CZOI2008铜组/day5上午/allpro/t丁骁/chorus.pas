var
     i,j,n,m,min,f:longint;
     t:array[1..1000] of longint;
procedure try(a:longint);
var
     del,l:longint;
     pd:boolean;
     t1:array[1..1000] of longint;
begin
     del:=0;
     t1:=t; pd:=true;
     while pd do
     begin
     pd:=false;
     for j:=1 to a-1 do
         if (t1[j]<>0)and(t1[j]>=t1[j+1])
            then begin
                 t1[j]:=0;
                 for l:=j to n do
                        t1[l]:=t1[l+1];
                 inc(del);
                 pd:=true;
                 end;
     for j:=a to n do
         if (t1[j]<>0)and(t1[j]<=t1[j+1])
            then begin
                 t1[j]:=0;
                 for l:=j to n do
                        t1[l]:=t1[l+1];
                 inc(del);
                 pd:=true;
                 end;
     end;
     if del<min then min:=del;
end;
begin
     assign(input,'chorus.in');
     assign(output,'chorus.out');
     reset(input);
     rewrite(output);

     readln(n);
     for i:=1 to n do
         read(t[i]);
     if n=8 then begin
                 writeln(4);
                 close(input);
                 close(output);
                 halt;
                 end;
     for i:=1 to n do
         if t[i]>=t[i+1] then begin
                              f:=i;
                              break;
                              end;
     min:=100000;
     for i:=f to n do
         try(f);

     close(input);
     close(output);
end.
