var hp:array[0..100000] of record r,key:longint; end;
    prime:array[0..300] of longint;
    top,n,k,i,j,last,tk,t:longint;
procedure qsort(l,r:longint);
  var i,j,x,t:longint;
  begin
    i:=l; j:=r; x:=prime[(i+j) div 2];
    repeat
      while prime[i]<x do inc(i);
      while prime[j]>x do dec(j);
        if i<=j then begin t:=prime[i]; prime[i]:=prime[j]; prime[j]:=t;
                           inc(i); dec(j);
                     end;
    until i>j;
    if i<r then qsort(i,r);
    if l<j then qsort(l,j);
  end;
procedure insert(x,rank:longint);
  var i,j:longint;
  begin
    inc(top);
    hp[top].key:=x;
    hp[top].r:=rank;
    j:=top;
    while (j div 2>=1) and (hp[j div 2].key>hp[j].key) do
      begin t:=hp[j div 2].key;
            hp[j div 2].key:=hp[j].key;
            hp[j].key:=t;
            t:=hp[j div 2].r;
            hp[j div 2].r:=hp[j].r;
            hp[j].r:=t;
            j:=j div 2;
      end;
  end;
procedure pop;
  var x,y,i,j:longint;
  begin
    last:=hp[1].key;
    tk:=hp[1].r;
    hp[1].key:=hp[top].key;
    hp[1].r:=hp[top].r;
    dec(top);
    x:=hp[1].key; y:=hp[1].r;
    i:=1; j:=i*2;
    while j<=top do
      begin if (j<top) and (hp[j].key>hp[j+1].key) then inc(j);
            if hp[j].key<x
            then begin hp[i].key:=hp[j].key; hp[i].r:=hp[j].r; i:=j; j:=i*2; end
            else j:=top+1;
      end;
    hp[i].key:=x; hp[i].r:=y;
  end;
procedure int;
  begin
    readln(n,k);
    for i:=1 to n do
      read(prime[i]);
    readln;
    qsort(1,n);
  end;
procedure workit;
  begin
    top:=0;
    for i:=1 to n do
      insert(prime[i],i);
    last:=-maxlongint;
    for i:=1 to k do
      begin pop;
            for j:=tk to n do
              begin if maxlongint div prime[j]<last
                    then insert(maxlongint,n)
                    else insert(prime[j]*last,j);
              end;
            while hp[1].key=last do pop;
          
      end;
    writeln(last);
  end;
begin
assign(input,'panda.in');
reset(input);
assign(output,'panda.out');
rewrite(output);

  int;
  workit;

close(input);
close(output);
end.
