var a:array[1..100]of longint;
    b:array[0..1000000]of longint;
    ans,flag,i,j,k,n,m,f,r,t:longint;

procedure pop;
 var i,j,tt:longint;
  begin
   ans:=b[1];
   b[1]:=b[m];
   dec(m);
   j:=2;i:=1;
   while j<=m do begin
    if (j<m)and(b[j+1]<b[j]) then inc(j);

    if b[i]>b[j] then begin
     tt:=b[i];
     b[i]:=b[j];
     b[j]:=tt;
     i:=j;
     j:=i*2;
     end else j:=m+1;
   end;
  end;


procedure insert(x:longint);
 var tt,i,j:longint;
  begin
   inc(m);
   b[m]:=x;
   j:=m;
   while (j div 2>=1)and(b[j]<b[j div 2]) do begin
     tt:=b[j div 2];
     b[j div 2]:=b[j];
     b[j]:=tt;
     j:=j div 2;
     end;
  end;


begin
 assign(input,'panda.in');
 assign(output,'panda.out');
 reset(input);
 rewrite(output);

 readln(n,k);
 m:=0;
 for i:=1 to n do begin read(a[i]);insert(a[i]);end;

 t:=0;
 while t<k do begin
  pop;inc(t);

  for i:=1 to n do insert(a[i]*ans);
  
  while b[1]=ans do pop;
 end;
 writeln(ans);
 close(input);
 close(output);
end.
