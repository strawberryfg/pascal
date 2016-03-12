Program palinInput, Output);
type
  arr=array[0..5000] of integer;
var
  h1,m1,s1,ms1,h2,m2,s2,ms2:word;
  ch,ch1:array[1..5000] of char;
  a,b:arr;
  min,n,b1,b2:integer;

procedure init;
var i:integer;
begin
  assign(input,'palin.in');
  reset(input);
  readln(n);
  for i:=1 to n do
    begin
      read(ch[i]);
      ch1[n-i+1]:=ch[i];
    end;
  close(input);
end;

function smaller(a,b:integer):integer;
begin
  if a>b then smaller:=b else smaller:=a;
end;

procedure doit;
var
  x,i,j:integer;

begin
  fillchar(a,sizeof(a),0);
  min:=n;

  for i:=1 to n do
    begin
      b2:=0;
      for j:=1 to smaller(n-i,n div 2) do
         begin
           b1:=b2;
           b2:=a[j];

           if ch[i]=ch1[j] then begin if b1+1>a[j] then a[j]:=b1+1; end
             else if a[j-1]>a[j] then a[j]:=a[j-1];
           if i+j>=n-1 then
             begin
               x:=n-a[j]*2-(n-i-j);
               if min>x then min:=x;
             end;
         end;
    end;
  assign(output,'palin.out');
  rewrite(output);
  writeln(min);
  close(output)
end;

begin
  init;
  doit;
end.
