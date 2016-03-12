const
     maxn=50;
var
     n1,n2,t,j,i:longint;
     s:string;
     a,b:array[1..maxn] of char;
     n,m:array[1..maxn] of longint;
procedure change(x,y:longint);
var
     k:longint;
     l:char;
begin
     k:=m[x];
     m[x]:=m[y];
     m[y]:=k;
     l:=b[x];
     b[x]:=b[y];
     b[y]:=l;
end;
procedure mn;
begin
     for j:=1 to n1+n2-1 do
         if (n[j]=1)and(n[j+1]=2) then change(j,j+1);
     n:=m; a:=b;
end;
begin
     assign(input,'kolone.in');
     assign(output,'kolone.out');
     reset(input);
     rewrite(output);

     readln(n1,n2);
     for i:=1 to n1 do
         n[i]:=1;
     for i:=1 to n2 do
         n[n1+i]:=2;
     readln(s);
     for i:=1 to n1 do
         a[n1-i+1]:=s[i];
     readln(s);
     for i:=1 to n2 do
         a[n1+i]:=s[i];
     readln(t);
     m:=n; b:=a;
     for i:=1 to t do
         mn;
     for i:=1 to n1+n2 do
         write(a[i]);
     writeln;

     close(input);
     close(output);
end.
