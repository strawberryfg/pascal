var opt:array[-10..1000000] of qword;
    a:array[0..4] of longint;
    n:longint;
    ans:qword;
procedure dp(x:longint);
  var i,j:longint;
  begin
   fillchar(opt,sizeof(opt),0);
   opt[0]:=1;
   a[1]:=1; a[2]:=2; a[3]:=5;
   for i:=1 to 3 do
     for j:=a[i] to x do
       opt[j]:=opt[j-a[i]]+opt[j];
  end;

procedure int;
  var d1,d2,d3,d4,d5:longint;
  begin
    readln(n);
    if n<=1000000
    then dp(n)
    else dp(1000000);
   opt[0]:=0;
    if n<=1000000
    then begin
            if n>=1 then d1:=1 else d1:=0;
            if n>=2 then d2:=1 else d2:=0;
            if n>=3 then d3:=1 else d3:=0;
            if n>=4 then d4:=1 else d4:=0;
            if n>=5 then d5:=1 else d5:=0;
            if d1<opt[n-1] then d1:=opt[n-1];
            if d2<opt[n-2] then d2:=opt[n-2];
            if d3<opt[n-3] then d3:=opt[n-3];
            if d4<opt[n-4] then d4:=opt[n-4];
            if d5<opt[n-5] then d5:=opt[n-5];
            ans:=opt[n]+d1+d1+d2+d2+d3+d3+d4+d4+d5;
        end;
  end;

begin
assign(input,'sugar.in');
reset(input);
assign(output,'sugar.out');
rewrite(output);

  int;
  writeln(ans);

close(input);
close(output);
end.
