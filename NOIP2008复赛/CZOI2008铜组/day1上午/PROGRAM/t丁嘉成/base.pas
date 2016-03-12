var total:longint;

procedure start;
begin
assign(input,'base.in');reset(input);
assign(output,'base.out');rewrite(output);
end;

procedure over;
begin
close(input);
close(output);
end;

procedure intt;
begin
readln(a,b,c,d);
total:=0;
end;

procedure outt;
begin
writeln(total);
end;

procedure change(n,var num:longint,m);
var i,j:longint;
begin

end;

procedure pd(num);
var i,j longint;
begin

end;

procedure run;
var i,j:longint;
begin
for i:=a to b do
  begin
    for j:=c to d do
      begin
        n:=i;
        change(10,n,j);
        pd(n);
        if pd then inc a[i];
      end;
    if a[i]=1 then inc(total);
  end;
end;

begin
start;
intt;
run;
outt;
over;
end.
