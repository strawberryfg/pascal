var t:char;
    s1,s2:string;
    len1,len2,i,j,k,max:integer;
    f:array[0..100,0..100]of integer;
begin
assign(input,'align.in');
reset(input);
assign(output,'align.out');
rewrite(output);
readln(s1);
readln(s2);
len1:=length(s1);
len2:=length(s2);
max:=-1000;
for i:=1 to len1 div 2 do
    begin
    t:=s1[i];
    s1[i]:=s1[len1+1-i];
    s1[len1+1-i]:=t;
    end;
for i:=1 to len2 div 2 do
    begin
    t:=s2[i];
    s2[i]:=s2[len2+1-i];
    s2[len2+1-i]:=t;
    end;
for i:=0 to len1 do
    for j:=0 to len2 do
        f[i,j]:=-1000;
f[0,0]:=0;
for i:=0 to len1 do
    for j:=0 to len2 do
        begin
        if f[i,j]>-1000 then
           begin
           for k:=1 to len1 do
               begin
               if i+k<=len1 then
                  begin
                  if f[i+k,j]<f[i,j]-1 then
                     begin
                     f[i+k,j]:=f[i,j]-1;
                     if f[i+k,j]>max then max:=f[i+k,j];
                     end;
                  end;
               end;
           for k:=1 to len2 do
               begin
               if j+k<=len2 then
                  begin
                  if f[i,j+k]<f[i,j]-1 then
                     begin
                     f[i,j+k]:=f[i,j]-1;
                     if f[i,j+k]>max then max:=f[i,j+k];
                     end;
                  end;
               end;
           if (i+1<=len1)and(j+1<=len2) then
              if s1[i+1]=s2[j+1] then
                 begin
                 if f[i+1,j+1]<f[i,j]+2 then
                    begin
                    f[i+1,j+1]:=f[i,j]+2;
                    if f[i+1,j+1]>max then max:=f[i+1,j+1];
                    end;
                 end

        else
           if f[i+1,j+1]<f[i,j] then
              begin
              f[i+1,j+1]:=f[i,j];
              if f[i+1,j+1]>max then max:=f[i+1,j+1];
              end;
           end;
        end;
writeln(max);
close(input);
close(output);
end.
