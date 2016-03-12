var n,i1,i2,max:byte;
    place:packed array[0..11,0..11]of char;
procedure try(dep:byte);
          var i1,i2,t1,t2:byte;
          begin
          if dep>max then max:=dep;
          for i1:=1 to n do
              for i2:=1 to n do
                  if place[i1,i2]='.' then
                     begin
                     place[i1,i2]:='Y';
                     t1:=i1;
                     t2:=i2-1;
                     while place[T1,T2] in ['.','#'] do
                        begin
                        if place[T1,T2]='.' then place[T1,T2]:='#'
                                            else place[T1,T2]:='&';
                        dec(t2);
                        end;
                     t1:=i1;
                     t2:=i2+1;
                     while place[T1,T2] in ['.','#'] do
                        begin
                        if place[T1,T2]='.' then place[T1,T2]:='#'
                                            else place[T1,T2]:='&';
                        inc(t2);
                        end;
                     t1:=i1-1;
                     t2:=i2;
                     while place[T1,T2] in ['.','#'] do
                        begin
                        if place[T1,T2]='.' then place[T1,T2]:='#'
                                            else place[T1,T2]:='&';
                        dec(t1);
                        end;
                     t1:=i1+1;
                     t2:=i2;
                     while place[T1,T2] in ['.','#'] do
                        begin
                        if place[T1,T2]='.' then place[T1,T2]:='#'
                                            else place[T1,T2]:='&';
                        inc(t1);
                        end;
                     try(dep+1);
                     t1:=i1;
                     t2:=i2-1;
                     while place[T1,T2] in ['&','#'] do
                        begin
                        if place[T1,T2]='&' then place[T1,T2]:='#'
                                            else place[T1,T2]:='.';
                        dec(t2);
                        end;
                     t1:=i1;
                     t2:=i2+1;
                     while place[T1,T2] in ['&','#'] do
                        begin
                        if place[T1,T2]='&' then place[T1,T2]:='#'
                                            else place[T1,T2]:='.';
                        inc(t2);
                        end;
                     t1:=i1-1;
                     t2:=i2;
                     while place[T1,T2] in ['&','#'] do
                        begin
                        if place[T1,T2]='&' then place[T1,T2]:='#'
                                            else place[T1,T2]:='.';
                        dec(t1);
                        end;
                     t1:=i1+1;
                     t2:=i2;
                     while place[T1,T2] in ['&','#'] do
                        begin
                        if place[T1,T2]='&' then place[T1,T2]:='#'
                                            else place[T1,T2]:='.';
                        inc(t1);
                        end;
                     end;
          end;
begin
assign(input,'fire.in');
assign(output,'fire.out');
reset(input);
readln(n);
for i1:=1 to n do
    begin
    for i2:=1 to n do
        read(place[i1,i2]);
    readln;
    end;
close(input);
try(1);
rewrite(output);
dec(max);
writeln(max);
close(output);
end.