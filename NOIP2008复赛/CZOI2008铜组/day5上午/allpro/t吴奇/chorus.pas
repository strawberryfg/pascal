program chorus;
var n,i,min,now:longint;
    t,a:array[1..100]of longint;
function left(x:longint):longint;
var i,out,now,k:longint;
begin
     out:=0;
     now:=x;
     k:=0;
     for i:=x-1 downto 1 do
     begin
         if t[i]>=t[now] then begin inc(out);inc(k);end
                        else begin
                                   now:=now-k-1;
                                   k:=0;
                             end;
     end;
     exit(out);
end;
function right(x:longint):longint;
var out,i,now,k:longint;
begin
     out:=0;
     k:=0;
     for i:=x+1 to n do
     begin
          if t[i]<=t[now] then begin inc(out);inc(k);end
                         else begin
                                   now:=now+k;
                             end;

     end;
     exit(out);
end;
begin
    assign(input,'chorus.in');reset(input);
    assign(output,'chorus.out');rewrite(output);
    readln(n);
    for i:=1 to n do
    read(t[i]);
    min:=maxlongint;
    for i:=2 to n-1 do
       begin
            now:=left(i)+right(i);
            if now<min then min:=now;
       end;
    writeln(min);
    close(input);
    close(output);
end.
