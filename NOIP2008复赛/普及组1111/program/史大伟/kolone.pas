
var n1,n2,i,j,t2,t,len1,len2:longint;
    a:array[1..255] of char;
    c:array[1..255,1..2] of longint;
    str1,str2:string;
    t1:char;
    d:array[1..255]of boolean;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readLN(n1,n2);
readln(str1);
readln(str2);
readln(t);
for i:=n1 downto 1 do
    a[i]:=str1[n1-i+1];
for i:=n1+1 to n2+n1 do
    a[i]:=str2[i-n1];
for i:=1 to n1 do
    for j:=1 to 2 do
    case j of
    1:c[i,j]:=1;
    2:c[i,j]:=-1;
    end;
for i:=n1+1 to n2+n1 do
    for j:=1 to 2 do
    case j of
    1:c[i,j]:=-1;
    2:c[i,j]:=1;
    end;
for i:=1 to t do
    begin
    len1:=n1;
    len2:=n1+1;
 if (c[len1,2]+c[len2,1])=-2 then begin
 t1:=a[len1];
 a[len1]:=a[len2];
 a[len2]:=t1;
 for j:=1 to 2 do
 begin
 t2:=c[len1,j];
 c[len1,j]:=c[len2,j];
 c[len2,j]:=t2;
 end;
 d[len1]:=false;
 d[len2]:=false;
 end;
 len1:=n1+1;
 len2:=n1;
    while (len1>=1)or(len2<=n2)  do
          begin
          if ((c[len1,2]+c[len1+1,1])=-2)and(d[len1])and(d[len1+1]) then begin
                                          t1:=a[len1];
                                          a[len1]:=a[len1+1];
                                          a[len1+1]:=t1;
                                          for j:=1 to 2 do
                                              begin
                                              c[len1,j]:=t2;
                                              c[len1,j]:=c[len1+1,j];
                                              c[len1+1,j]:=t2;
                                              end;
                                          d[len1]:=false;
                                          d[len1+1]:=false;
                                          end;
          if ((c[len2,1]+c[len2-1,2])=-2)AND(d[len2-1])and(d[len2]) then begin
                                            t1:=a[len2];
                                          a[len2]:=a[len2-1];
                                          a[len2-1]:=t1;
                                          for j:=1 to 2 do
                                              begin
                                              c[len2,j]:=t2;
                                              c[len2,j]:=c[len2-1,j];
                                              c[len2-1,j]:=t2;
                                              d[len2]:=false;
                                              d[len2-1]:=false;
                                              end;
                                            end;
          dec(len1);
          inc(len2);

          end;
           for J:=1 to n1+n2 do
          d[J]:=true;
    end;
for i:=1 to n1+n2 do
write(a[i]);
writeln;
close(input);
close(output);
end.
