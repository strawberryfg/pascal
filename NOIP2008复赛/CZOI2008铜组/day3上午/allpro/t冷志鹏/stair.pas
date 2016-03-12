program stair;
var n,k,i,sum,temp:longint;
    a:array [1..31]of longint;

function suan(n:longint):longint;
var n1,n2,n3,count,j,nn,sum,i:longint;
    b:array[1..100]of longint;
begin
        count:=0;
        for i:=1 to 30 do b[i]:=0;
        i:=1;
        nn:=n;
        while i<>0 do
        begin
        while nn<>0do
        begin
                if b[i]>=3 then
                                begin
                                nn:=nn+b[i];
                                b[i]:=0;
                                dec(i);
                                end
                           else begin
                                inc(b[i]);
                                dec(nn);
                                inc(i);
                                end;
        end;
        inc(count);
        dec(i);
        if i<>0 then
        begin
        nn:=nn+b[i];
        b[i]:=0;
        dec(i);
        end
        end;
        suan:=count;
end;
begin             
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);   
        readln(n);
        readln(k);
        for i:=1 to k do
                readln(a[k]);
        sum:=suan(n);
        for i:=1 to k do
                begin
                temp:=suan(a[i]);
                sum:=sum-temp;
                end;
        writeln(sum);
close(input);
close(output);
end.
