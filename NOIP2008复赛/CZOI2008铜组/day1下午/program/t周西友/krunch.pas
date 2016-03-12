var str1:string;
    t,k,i,j:integer;
begin
assign(input,'krunch.in');
 reset(input);
 assign(output,'krunch.out');
 rewrite(output);
 readln(str1);
 k:=length(str1);
 for i:= 1 to k do
 begin
 t:=ord(str1[i]);
 if (t=65)or(t=69)or(t=73)or(t=79)or(t=85)
 then begin delete(str1,i,1); dec(i);end;
 end;
 k:=length(str1);
 for i:=1 to k do
   for j:=i+1 to k+1 do
 if (str1[i]=str1[j])and(str1[j]<>' ')and(str1[j]<>',') then begin delete(str1,j,1);end;
 k:=length(str1);
 for i:=1 to k do
   for j:=i+1 to k+1 do
 if str1[i]=str1[j] then begin delete(str1,j,1);end;
 writeln(str1);
 close(input);
 close(output);
end.