var a,b:array[0..100001] of longint;
    min,n,i,ans,tm:longint;
procedure int;
  begin
    readln(n);
    for i:=1 to n do readln(a[i]);
    b[1]:=a[1];
    b[2]:=a[1];
    min:=maxlongint;
    tm:=maxlongint;
    for i:=2 to n do
      begin 
            b[i+1]:=a[i]+a[i]-b[i];
            if (i mod 2=0) and (b[i+1]-b[i]<min)
            then min:=b[i+1]-b[i];
            if (i mod 2=1) and (b[i+1]-b[i]<tm)
            then tm:=b[i+1]-b[i];
      end;
   
   ans:=min div 2+1;
   if tm<0 then ans:=ans-abs(tm) div 2;
   if ans<0 then ans:=0;
   writeln(ans);
  end;


begin
assign(input,'sequence.in');
reset(input);
assign(output,'sequence.out');
rewrite(output);

  int;

close(input);
close(output);
end.
