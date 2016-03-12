var //h,m,ss:array[1..3] of longint;
    si,sj,sl:array[1..3] of string;
    v1,v2,v3:array[1..3]of longint;
    s1,s2:string;
    i,j,code:longint;
procedure build;
begin
si[1]:=copy(s1,1,2);
si[2]:=copy(s1,4,2);
si[3]:=copy(s1,7,2);
sj[1]:=copy(s2,1,2);
sj[2]:=copy(s2,4,2);
sj[3]:=copy(s2,7,2);
for i:=1 to 3 do
    begin
    val(si[i],v1[i],code);
    val(sj[i],v2[i],code);
    end;
end;
procedure print;
begin
for i:=1 to 3 do
    begin
    str(v3[i],sl[i]);
    if length(sl[i])<2 then sl[i]:='0'+sl[i];
    end;
for i:=1 to 2 do
    write(sl[i],':');
write(sl[3]);
writeln;
end;
procedure st;
begin
dec(v2[1]);
v2[2]:=v2[2]+60;
end;
procedure ec;
begin
for i:=1 to 3 do
v3[i]:=v2[i]-v1[i] ;
end;
procedure fa;
begin
dec(v2[2]);
v2[3]:=v2[3]+60;
end;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
readln(s1);
readln(s2);
build;
if v1[1]<=v2[1] then begin
                    if v1[3]<=v2[3] then begin
                                         if v1[2]<=v2[2] then //begin
                                                              ec;
                                                              //end
                                         end
                                    else begin
                                         fa;
                                         if v1[2]<=v2[2] then   ec
                                                              else   begin
                                                                     st;
                                                                     ec;
                                                                     end
                                         end

                    end
                else begin
                     v2[1]:=v2[1]+24;
                     if v1[3]<=v2[3] then //begin
                                          if v1[2]<=v2[2] then ec
                                          //end
                                     else begin
                                          fa;
                                          if v1[2]<=v2[2] then ec
                                                          else begin
                                                               st;
                                                               ec;
                                                               end
                                          end;
                     end;
print;
close(input);
close(output);
end.
