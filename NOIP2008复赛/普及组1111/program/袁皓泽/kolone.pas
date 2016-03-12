var n1,n2,i,t,j:longint;
    a:array[1..100]of char;
    hash,temphash:array[1..100]of longint;
procedure exchange(var a,b:longint);
var t:longint;
begin
  t:=a;a:=b;b:=t;
end;
procedure exchange1(var a,b:char);
var t:char;
begin
  t:=a;a:=b;b:=t;
end;
procedure print;
var i:longint;
begin
  for i:=1 to n1+n2 do
      write(a[i]);
  writeln;
end;
begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  readln(n1,n2);
  fillchar(hash,sizeof(hash),0);
  for i:=n1 downto 1 do
      begin
      read(a[i]);
      hash[i]:=1;
      end;
  readln;
  for i:=1 to n2 do
      begin
      read(a[i+n1]);
      hash[n1+i]:=2;
      end;
  read(t);
  if t=0 then begin print;close(input);close(output);exit;end;
  for i:=1 to t do
      begin
        temphash:=hash;
        for j:=1 to n1+n2-1 do
            if (hash[j]=1)and(hash[j+1]=2) then begin exchange(temphash[j],temphash[j+1]);exchange1(a[j],a[j+1]);end;
        hash:=temphash;
      end;
  print;
  close(input);
  close(output);
end.
