var a:array[1..200]of longint;
    hash:array[1..225] of boolean;
    b:array[0..9,0..10] of longint;
    i,j,k,num,n,max:longint;

    function make(k,t:longint):longint;
      begin
      make:=0;
      while k>=10 do
        begin
        make:=make+b[k mod 10,t+1];
        k:=k div 10;
        end;
      make:=make+b[k,t+1];
      end;

    procedure try(k:longint);
      var i,t:longint;
      begin
      for i:=1 to num do
          begin
          t:=make(a[i],k);
          if t<255 then hash[t]:=false;
          end;
      end;

begin
assign(input,'ghillie.in');
reset(input);
assign(output,'ghillie.out');
rewrite(output);

    readln(n);
    while not eoln do
      begin
        inc(num);
        read(a[num]);
        hash[a[num]]:=true;
        if a[num]>max then max:=a[num];
      end;
    for i:=0 to 9 do
        b[i,1]:=i;
    for i:=0 to 9 do
        for j:=2 to n+1 do
            b[i,j]:=b[i,j-1]*i;
    for i:=1 to n do
        try(i);
    k:=0;
    for i:=1 to max do
        if hash[i]=true then if k=0 then begin k:=100; write(i); end
                                    else write(' ',i);

    writeln;

close(input);
close(output);
end.