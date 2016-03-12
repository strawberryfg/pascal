

  const
     max = 1000;
  var
     a : array[1..max] of boolean;
     b:array[1..max] of longint;
     n,i:longint;
  procedure eratos;

    var
       i,j : longint;

    begin
       a[1]:=false;
       for i:=2 to max do
         a[i]:=true;
       for i:=2 to max div 2 do
         if a[i] then
           for j:=2 to max div i do
             a[i*j]:=false;
       j:=0;
       for i:=1 to n do

          if a[b[i]] then

             inc(j);

        writeln(j);


    end;

  begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  n:=0;
     {read(n);
     for i:=1 to n do
        read(b[i]);}

        while not eof do
                begin
                inc(n);
                readln(b[n]);
                end;

     eratos;
     close(input);
     close(output);
  end.
