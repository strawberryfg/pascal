program fire;
var a:array[0..11,0..11] of char;
    i,j,s,ddd,n:integer;
function djj(s:integer):integer;
var l,e,i,j,k:integer;
    flag:boolean;
begin
    i:=1;j:=1;e:=1;
    while e<=n*n do
          begin
          if (a[i,j]='.') then a[i,j]:='D'
                          else if (a[i,j]='X') then begin inc(j);if j>4 then begin j:=1;inc(i)end;continue;end
                                               else if (a[i,j]='D') then if (i=1)and(j=1) then begin
                                                                                                 a[i,j]:='.';
                                                                                                 dec(s);
                                                                                                 inc(j);
                                                                                                 inc(e);
                                                                                                 if (a[i,j]='X') then begin
                                                                                                                        inc(j);
                                                                                                                        if j>4 then begin
                                                                                                                                      j:=1;
                                                                                                                                      inc(i)
                                                                                                                                    end;
                                                                                                                        continue;
                                                                                                                       end
                                                                                               end
                                                                                          else begin
                                                                                                 a[i,j]:='.';
                                                                                                 dec(s);
                                                                                                 inc(j);
                                                                                                 if j>4 then begin
                                                                                                               j:=1;
                                                                                                               inc(i)
                                                                                                             end;
                                                                                                 if (a[i,j]='X') then begin
                                                                                                                        inc(j);
                                                                                                                        if j>4 then begin
                                                                                                                                      j:=1;
                                                                                                                                      inc(i)
                                                                                                                                    end;
                                                                                                                        continue;
                                                                                                                       end
                                                                                                                 else begin
                                                                                                                        a[i,j]:='D';
                                                                                                                        inc(s);
                                                                                                                      end;
                                                                                               end;
          flag:=true;
          for k:=i+1 to n do
              for l:=j+1 to n do
                  begin
                    if (a[i,k]='D')or(a[l,j]='D') then begin flag:=false; break; end
                                            else if (a[i,k]='X')or(a[k,j]='X') then break;
                  end;
           for k:=i-1 downto 1 do
              for l:=j-1 downto 1 do
                  begin
                    if (a[i,k]='D')or(a[l,j]='D') then begin flag:=false; break; end
                                            else if (a[i,k]='X')or(a[k,j]='X') then break;
                  end;
          if flag=false then begin a[i,j]:='.';inc(s);inc(j);if j>n then begin j:=1;inc(i);end;inc(e)end
                        else begin inc(j);if j>4 then begin j:=1;inc(i);end;inc(e);end;
          end;
  djj:=s;
end;
begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
      begin
      for j:=1 to n do
          read(a[i,j]);
      readln
      end;
  close(input);
  s:=0;
  ddd:=djj(s);
  writeln(ddd);
  close(output);
end.
