var a:array[1..17] of integer;
    h:array[1..17] of integer;
    n:integer;
function ok(i:integer):boolean;
var j:integer;
begin
  ok:=true;
  for j:=2 to trunc(sqrt(i)) do if (i mod j=0) then begin ok:=false;exit; end;
end;
procedure print;
var i:integer;
begin
  for i:=1 to n-1 do write(a[i],' ');
  write(a[n]);
  writeln;
end;

procedure huan(i:integer);
var j:integer;
begin
  if (i=n+1) and ok(a[1]+a[n]) and (a[n]<>0) then print;
  for j:=2 to n do if (h[j]=0) and ok(j+a[i-1]) then
                                                     begin
                                                     h[j]:=1;
                                                     a[i]:=j;
                                                     huan(i+1);
                                                     h[j]:=0;
                                                     a[i]:=0;
                                                     end;
end;


begin
 assign(input,'prime.in');
 reset(input);
 assign(output,'prime.out');
 rewrite(output);
 read(n);
 fillchar(h,sizeof(h),0);
 a[1]:=1;
 h[1]:=1;
 huan(2);
 close(input);
 close(output);
end.
