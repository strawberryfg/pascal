var a:array[1..10000] of char;
    t:array[1..10000] of boolean;
    i,j,p,l,n1,n2,time:longint;
    k:string;
procedure ch(var a,b:char);
  var x:char;
  begin
  x:=b;
  b:=a;
  a:=x;
  end;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n1,n2);
readln(k);
for i:=n1 downto 1 do
    begin
    a[i]:=k[n1-i+1];
    t[i]:=true;
    {t[i]:=i; }
    end;
readln(k);
for i:=1 to n2 do
    begin
    a[i+n1]:=k[i];
    t[i+n1]:=false;
    {k[i]:=i;  }
    end;
readln(time);
{if time>n1+n2-1 then time:=n1+n2-1;}
while time>0 do
      begin
      i:=1;
      while i<=n1+n2 do
          begin
          if (t[i]=true)and(t[i+1]=false) then
             begin
             ch(a[i],a[i+1]);
             t[i+1]:=true;
             t[i]:=false;
             inc(i);
             end;
          inc(i);
          end;
      dec(time);
      end;
for i:=1 to n1+n2 do
    write(a[i]);
close(input);
close(output);
end.
