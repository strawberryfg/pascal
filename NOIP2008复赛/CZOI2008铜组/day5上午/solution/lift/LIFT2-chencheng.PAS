var n,a,b,i,x:longint;
    r,r1:set of 1..200;
    k,s:array[1..200]of longint;
begin
     assign(input,'lift.in');
     reset(input);
     assign(output,'lift.out');
     rewrite(output);
     readln(n,a,b);
     for i:=1 to n do read(k[i]);
     for i:=1 to n do s[i]:=maxlongint;
     s[a]:=0;
     r:=[a];
     x:=1;
     while (s[b]=maxlongint)and(x<>0) do
     begin
          x:=0;
          r1:=[];
          for i:=1 to n do if i in r then
          begin
               if (i+k[i]<=n)and(s[i]+1<s[i+k[i]])then
               begin
                    x:=x+1;
                    s[i+k[i]]:=s[i]+1;
                    r1:=r1+[i+k[i]]
               end;
               if (i-k[i]>=0)and(s[i]+1<s[i-k[i]])then
               begin
                    x:=x+1;
                    s[i-k[i]]:=s[i]+1;
                    r1:=r1+[i-k[i]]
               end;
          end;
          r:=r1
     end;
     if s[b]<>maxlongint then writeln(s[b]) else writeln(-1);
     close(input);
     close(output)
end.