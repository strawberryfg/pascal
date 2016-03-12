Program p8_3(Input, Output);
const maxn=5000;
var i,j,n,l,maxlen:longint;
    a,len,t:array [0..maxn] of longint;

begin
  assign(input,'buylow.in');
  reset(input);
  assign(output,'buylow.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do len[i]:=1;
  for i:=n-1 downto 1 do
      for j:=i+1 to n do
          if (a[j]<a[i]) and (len[j]>=len[i]) then len[i]:=len[j]+1;
  maxlen:=1;
  for i:=1 to n do if len[i]>maxlen then maxlen:=len[i];
  a[0]:=maxlongint; len[0]:=maxlen+1;
  for i:=0 to n do if len[i]=1 then t[i]:=1 else t[i]:=0;
  for l:=1 to maxlen do
  begin
       for i:=n downto 1 do
           if len[i]=l then
              begin
                   j:=i-1;
                   while (j>=0) and (a[j]<>a[i]) do
                   begin
                        if (a[j]>a[i]) and (len[j]=l+1) then inc(t[j],t[i]);
                        dec(j)
                   end;
              end;
  end;
  writeln(maxlen,' ',t[0]);
  close(input);
  close(output);
end.
