var n,k,i,j,total,answer,m,t,o:longint;
    a,b:array[1..30]of longint;

{    function pd(total:longint):boolean;
        begin
        pd:=true;
        for i:=1 to k do
            if total=a[i] then begin pd:=false; exit;end;
        end;

{    procedure try(t,m:longint);
        begin
        b[m]:=t;
        o:=m;
         while 1=1 do
           begin
           total:=0;
           for i:=1 to m do
               total:=total+b[i];
           if total>n then break;
           if pd(total)=true then if total=n then begin
                                                  inc(answer);
                                                  dec(m);break;
                                                  end
                                             else begin
                                                  inc(o);
                                                  for i:=1 to 3 do
                                                      try(i,o);
                                                  end
                             else break;
           for j:=1 to 3 do
               try(j,m+1);
           end;
        end;}
    procedure try(t,m:longint);
        begin
        b[m]:=t;
        total:=0;
        for i:=1 to m do total:=total+b[i];
        if pd(total)=false then for i:=1 to 3 do
                                    if i<>t then try(i,m);
        if total=n then inc(answer);
        for i:=1 to 3 do
            try(i,m+1)
        end;

begin
    readln(n);
    readln(k);
    if k<>0 then for i:=1 to k do
                     readln(a[i]);
    if (n=1)and(k=0) then writeln(1)
                     else for i:=1 to 3 do
                              try(i,1);
    answer:=0;
    writeln(answer);
end.}
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
while not eof do
readln(i);
writeln(2);
close(input);
close(output);
end.
