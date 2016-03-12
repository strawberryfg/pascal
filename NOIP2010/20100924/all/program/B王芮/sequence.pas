var c,q:array[1..100000]of int64;
    h,t,i,j,n:longint;
    tf:boolean;
begin
  assign(input,'sequence.in');
  reset(input);
  assign(output,'sequence.out');
  rewrite(output);
  readln(n);
  t:=-1;
  h:=0;
  for i:=1 to n do
    readln(c[i]);
  for i:=c[1]*2-c[2] to c[2] do
    begin
      tf:=true;
      q[1]:=i;
      for j:=2 to n+1 do
        begin
          q[j]:=c[j-1]*2-q[j-1];
          if q[j]<q[j-1] then begin tf:=false;break; end;
        end;
      if tf=true then begin h:=i;break;end;
    end;
  for i:=c[2] downto h do
    begin
      tf:=true;
      q[1]:=i;
      for j:=2 to n+1 do
        begin
          q[j]:=c[j-1]*2-q[j-1];
          if q[j]<q[j-1] then begin tf:=false;break; end;
        end;
      if tf=true then begin t:=i;break;end;
    end;
   writeln(t-h+1);
   close(input);
   close(output);
end.