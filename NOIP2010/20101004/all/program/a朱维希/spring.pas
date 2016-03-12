var a:array[1..18,1..18]of longint;
    e:array[1..18]of boolean;
    i,j,k,n,m,ans1:longint;



procedure search(dep,ans:longint);
 var i,j,tt:longint;
  begin
   if dep<n div 2 then begin
    for i:=1 to n do
     for j:=1 to n do
    if (i<>j)and(not(e[i]))and(not(e[j])) then begin
     e[i]:=true;
     e[j]:=true;
     search(dep+1,ans+a[i,j]);
     e[i]:=false;
     e[j]:=false;
    end
   end
   else begin
   if ans1>ans then ans1:=ans;
   end;
  end;



begin
 assign(input,'spring.in');
 assign(output,'spring.out');
 reset(input);
 rewrite(output);

 readln(n); 
 fillchar(e,sizeof(e),false);
 for i:=1 to n do
  begin
   for j:=1 to n do
    read(a[i,j]);
   readln;
  end;
 ans1:=maxlongint;
 search(0,0);
 writeln(ans1);
 close(input);
 close(output);
end.
