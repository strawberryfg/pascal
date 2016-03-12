program ex3;
var a:array[1..100] of string;
    s,m,n,i,j:integer;
procedure djjk(i,j:integer);
var qu:array[1..4] of byte;
    i1:integer;
    flag:array[1..4] of boolean;
begin
  flag[1]:=true;
  if i+1<m then for i1:=i+1 to m do
                    if a[i1,j]<>'0' then a[i1,j]:='0'
                                    else if a[i+1,j]='0' then begin flag[1]:=false; break; end
           else begin qu[1]:=1;flag[1]:=false;end;
  flag[2]:=true;
  if j+1<n then for i1:=j+1 to n do
                    if a[i,i1]<>'0' then a[i,i1]:='0'
                                    else if a[i,j+1]='0' then begin flag[2]:=false; break; end
           else begin qu[2]:=1;flag[2]:=false;end;
  flag[3]:=true;
  if i-1>1 then for i1:=i-1 downto 1 do
                    if a[i1,j]<>'0' then a[i1,j]:='0'
                                  else begin if a[i-1,j]='0' then flag[3]:=false; break; end
           else begin qu[3]:=1;flag[3]:=false;end;
  flag[4]:=true;
  if j-1>1 then for i1:=j-1 downto 1 do
                    if a[i,i1]<>'0' then a[i,i1]:='0'
                                  else begin if a[i,j-1]='0' then flag[4]:=false; break; end
           else begin qu[4]:=1;flag[4]:=false;end;
  if (flag[1])or(flag[2])or(flag[3])or(flag[4]) then begin
                                                       a[i,j]:='0';
                                                       if qu[1]=0 then djjk(i+1,j);
                                                       if qu[2]=0 then djjk(i,j+1);
                                                       if qu[3]=0 then djjk(i-1,j);
                                                       if qu[4]=0 then djjk(i,j-1);
                                                     end
                                                else a[i,j]:='0';
end;
procedure djj(i,j:integer);
var qu:array[1..4] of byte;
    i1:integer;
    flag:array[1..4] of boolean;
begin
  flag[1]:=true;
  if i+1<m then for i1:=i+1 to m do
                    if a[i1,j]<>'0' then a[i1,j]:='0'
                                    else if a[i+1,j]='0' then begin flag[1]:=false; break; end
           else begin qu[1]:=1;flag[1]:=false;end;
  flag[2]:=true;
  if j+1<n then for i1:=j+1 to n do
                    if a[i,i1]<>'0' then a[i,i1]:='0'
                                    else if a[i,j+1]='0' then begin flag[2]:=false; break; end
           else begin qu[2]:=1;flag[2]:=false;end;
  flag[3]:=true;
  if i-1>1 then for i1:=i-1 downto 1 do
                    if a[i1,j]<>'0' then a[i1,j]:='0'
                                  else begin if a[i-1,j]='0' then flag[3]:=false; break; end
           else begin qu[3]:=1;flag[3]:=false;end;
  flag[4]:=true;
  if j-1>1 then for i1:=j-1 downto 1 do
                    if a[i,i1]<>'0' then a[i,i1]:='0'
                                  else begin if a[i,j-1]='0' then flag[4]:=false; break; end
           else begin qu[4]:=1;flag[4]:=false;end;
  if (flag[1])or(flag[2])or(flag[3])or(flag[4]) then begin
                                                       a[i,j]:='0';
                                                       inc(s);
                                                       if qu[1]=0 then djjk(i+1,j);
                                                       if qu[2]=0 then djjk(i,j+1);
                                                       if qu[3]=0 then djjk(i-1,j);
                                                       if qu[4]=0 then djjk(i,j-1);
                                                     end
                                                else a[i,j]:='0';
end;
begin
  assign(input,'cell.in');
  reset(input);
  readln(m,n);
  for i:=1 to m do
      begin
        readln(a[i]);
      end;
  close(input);
  assign(output,'cell.out');
  rewrite(output);
  s:=0;
  for i:=1 to m do
      for j:=1 to n do
            if a[i,j]<>'0' then djj(i,j);
  writeln(s*2);
  close(output);
end.