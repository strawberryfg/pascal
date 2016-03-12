var n,i,ll,t,j,k,m:integer;
    c,str1,str2:string;
    tn:array[0..100]of string;
begin
 {assign(input,'charcom.in');
 reset(input);
 assign(output,'charcom.out');
 rewrite(output);}
 readln(n);
 readln(str1);
 str2:='';
 for i:=1 to n do str2:=str2+chr(i+64);
 for i :=0 to 100 do
 tn[n]:='';
 for i:=1 to n do
 tn[n]:=tn[n-1]+chr(n+64);
 t:=n-2;
 ll:=1;
 if n>2 then k:=1 else k:=0;
 while (t<=0)and(n>2) do
 begin
 k:=k+ll;
 dec(t);
 inc(ll);
 end;
 m:=3;
 while i<=k do
 begin
 if m=3 then c:='' else c:=chr(m);
 tn[n+1]:=tn[n+1]+'A'+chr(3)+c;
 inc(m,i);
 end;
 for j:=1 to n do if str1 in tn[j] then begin writeln(j);exit;end;
 close(input);
 close(output);
end.
