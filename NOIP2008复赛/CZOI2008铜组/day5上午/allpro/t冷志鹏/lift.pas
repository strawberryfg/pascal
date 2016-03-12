program lift;
var a,b,n,i,count:longint;
    k:array[1..200]of longint;

procedure tan(t:longint);
var  up,down:longint;
begin
        inc(count);
        if count>10000 then begin writeln('-1');close(input);close(output);halt;end;
        if t<>b then
                begin
                if t+k[t]>n then up:=10000
                            else up:=t+k[t];
                if t-k[t]<1 then down:=10000
                            else down:=t-k[t];
                if (up=down)and(up=10000)then begin writeln('-1');close(input);close(output);halt;end;
                if up<down then t:=up
                                 else t:=down;
                tan(t);
                end;
end;

begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
reset(output);
        readln(n,a,b);
        for i:=1 to n do
                read(k[i]);
        tan(a);
        writeln(count-1);
close(input);
close(output);
end.
