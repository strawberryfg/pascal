var i,j,time,n,d,maxv,temp,node:longint;
    s,t,v:array[0..101] of longint;
procedure search(dep,ct,tv:longint);
var i:longint;
begin
     inc(node);
     if node>10000000 then
        begin
              writeln(maxv);
              close(output);
              halt
        end;
     if dep>n
        then if tv>maxv then maxv:=tv else
        else begin
                  if t[dep]+ct<=time
                     then search(dep+1,ct+t[dep],tv+v[dep]);
                  if tv+s[dep+1]>maxv then search(dep+1,ct,tv)
              end 
end;
begin
     assign(input,'medic.in');
     reset(input);
     assign(output,'medic.out');
     rewrite(output);
     read(time);
     read(n);
     readln;
     for i:=1 to n do
     begin
          read(t[i]);
          read(v[i]);
          readln;
     end;
     close(input);
     for i:=1 to n-1 do
         for j:=i+1 to n do 
             if v[i]/t[i]<v[j]/t[j] then
                begin temp:=v[i]; v[i]:=v[j]; v[j]:=temp;
                      temp:=t[i]; t[i]:=t[j]; t[j]:=temp
                end;
     s[n+1]:=0;
     for i:=n downto 1 do s[i]:=s[i+1]+v[i];
     maxv:=0;
     node:=0;
     search(1,0,0);
     writeln(maxv);
     close(output);
end.
