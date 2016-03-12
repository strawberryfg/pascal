var stack:array[0..100] of integer;
    t,p,used:array[1..100] of integer;
    maxtime,m,i,price,max,time:longint;

procedure readin;
  begin
    assign(input,'medic.in');
    assign(output,'medic.out');
    reset(input);
    rewrite(output);
    readln(maxtime,m);
    for i:=1 to m do readln(t[i],p[i]);
    close(input);
    for i:=1 to 100 do used[i]:=0;
    stack[0]:=0;
    time:=0;
    price:=0;
    max:=0;
  end;

procedure search(depth:integer);
  var i:integer;

  function check(i:integer):boolean;
    begin
      check:=(used[i]=0) and (time+t[i]<=maxtime);
  end;

  begin
    if price>max then max:=price;
    for i:=stack[depth-1]+1 to m do
        if check(i) then 
        begin
            stack[depth]:=i;
            time:=time+t[i];
            price:=price+p[i];
            used[i]:=1;
            search(depth+1);
            stack[depth]:=0;
            time:=time-t[i];
            price:=price-p[i];
            used[i]:=0;
        end;
  end;

Begin
  readin;
  search(1);
  writeln(max);
  close(output)
End.