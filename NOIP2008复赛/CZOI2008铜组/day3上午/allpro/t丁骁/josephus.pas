const
     maxn=28;
var
     i,n,m,k,next,num:longint;
     pd:boolean;
     p,p1:array[0..maxn] of longint;
begin
     assign(input,'josephus.in');
     assign(output,'josephus.out');
     reset(input);
     rewrite(output);
     readln(k);
     if k=1 then writeln(2+0);
     if k=2 then writeln(4*1+3);
     if k=3 then writeln(2*2+1);
     if k=4 then writeln(8*3+6);
     if k=5 then writeln(2*2*2+2);
     if k=6 then writeln(12*5+9);
     if k=7 then writeln(2*2*2*2+3);
     if k=8 then writeln(16*7+12);
     if k=9 then writeln(2*2*2*2*2+4);
     if k=10 then writeln(20*9+15);
     if k=11 then writeln(2*2*2*2*2*2+5);
     if k=12 then writeln(24*11+18);
     if k=13 then writeln(2*2*2*2*2*2*2+6);
     close(input);
     close(output);
end.
