var t,n,i,j,total:longint;
        a:array[1..20,1..20]of longint;
        bb,b:array[1..100]of longint;

procedure print(sum:longint);
  begin
  for i:=1 to n-1 do if bb[i]=0 then exit;
  if sum>0 then if sum<total then total:=sum;
  end;

procedure try(dep,sum:longint);
  var i:longint;
  begin
  if dep>n then print(sum)
            else if b[dep]=1 then try(dep+1,sum)
                             else for i:=1 to dep-1 do
                                    if bb[i]=0 then
                                        begin
                                        inc(t,4);
                                        if t>15000000 then begin writeln(total);close(input);close(output);halt;end;
                                        bb[i]:=1;
                                        bb[dep]:=1;
                                        try(dep+1,sum+a[dep,i]);
                                        bb[i]:=0;
                                        bb[dep]:=0;
                                        try(dep+1,sum);
                                        end;

  end;

begin
assign(input,'spring.in');
reset(input);
assign(output,'spring.out');
rewrite(output);
readln(n);
t:=0;
for i:=1 to n do
        begin
        for j:=1 to n do
                read(a[i,j]);
        readln;
        end;
total:=maxlongint;
try(2,0);
writeln(total);
close(input);
close(output);
end.
