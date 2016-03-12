var
   ss1,ss,s,i,n,d,s1,s2,a1,a2,k,q:longint;
   f:array[0..100001] of integer;
   str:string;
   t:boolean;
begin
 assign(input,'bus.in');
 assign(output,'bus.out');
 reset(input);
 rewrite(output);

 readln(n,d);
 readln(str);
 for i:=1 to length(str) do
     if str[i]='H' then begin f[i]:=1;s1:=s1+1;end else begin f[i]:=0;s2:=s2+1;end;
 if abs(s1-s2)<=d then writeln(1)
 else
  begin
    s:=s1+s2;
    k:=1;q:=1;ss1:=0;
    while k<s do
       begin
         a1:=0;a2:=0;
         for i:=q to k do
            if f[i]=1 then a1:=a1+1 else a2:=a2+1;
         if abs(a1-a2)<=d then t:=true else t:=false;
         if t=true then inc(k) else begin q:=k;inc(k);inc(ss1);end;
       end;
    s:=s1+s2;ss:=0;
    k:=s;q:=k;
    while k>0 do
       begin
         a1:=0;a2:=0;
         for i:=q downto k do
            if f[i]=1 then a1:=a1+1 else a2:=a2+1;
         if abs(a1-a2)<=d then t:=true else t:=false;
         if t=true then dec(k) else begin q:=k;dec(k);inc(ss);end;
       end;
    if ss1<ss then writeln(ss1) else writeln(ss);
  end;

  close(input);
  close(output);
end.