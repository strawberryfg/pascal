program exp3;
var stack:array[0..10000] of longint;
      cs,ma,mb:integer;
      k1:array[0..201] of longint;
      f:longint;
      s,top,min,t,i,j,k,tk:longint;
      boo:char;
      a:array[0..10000] of longint;
begin
 assign(input,'d:\lift.in');
 reset(input);
 assign(output,'lift.out');
 rewrite(output);
 readln(cs,ma,mb);
 for i:=1 to cs do read(k1[i]);
 if ma=mb then begin writeln('0');close(input);close(output);halt;end;
 f:=0;
 top:=0;
 k:=ma;
 s:=1;
while (top>=0) do
  begin
   if (k>cs)or(k<=0) then
   begin
     stack[top]:=0;
     top:=top-1;
     k:=tk;
     f:=f+1;
     if top<0 then begin writeln('-1');close(input);close(output);halt;end;
   end
    else begin
             f:=f+1;
             if odd(f) then boo:='s' else boo:='x';
             if (boo='s') then
              begin
                tk:=k;
                top:=top+1;
                stack[top]:=k1[tk];
                k:=tk+k1[tk];
              end
              else begin
                       tk:=k;
                       top:=top+1;
                       stack[top]:=k1[tk];
                       k:=tk-k1[tk];
                      end;
              if k=mb then begin a[s]:=top;s:=s+1;break;end;
           end;
  end;
  min:=a[1];
  for i:=sizeof(a) downto 1 do
  if a[i]<>0 then begin t:=i;break;end;
  for i:=1 to t do
  if a[i]<min then min:=a[i];
  writeln(min);
  close(input);
  close(output);
end.
