var
     i,j,n,m:longint;
     sum:Qword;
     c:array[1..200] of Qword;
begin
     assign(input,'cow.in');
     assign(output,'cow.out');
     reset(input);
     rewrite(output);

     readln(n);
     if n<4 then sum:=1
            else begin
                 sum:=0;
                 c[1]:=1; c[2]:=0; c[3]:=0;
                 m:=4;
                 while m<=n do
                       begin
                       c[m]:=c[m-1]+c[m-3];
                       inc(m);
                       end;
                 for i:=1 to m do
                     sum:=sum+c[i];
                 end;
     writeln(sum);

     close(input);
     close(output);
end.
