var s,e,f,l,i,sum,k:longint;
    t:string;
function turn(n,k:longint):string;
        var i,j:longint;str:string;ch:char;
        begin
        str:='';
        while n>0 do
                begin
                j:=n mod k;
                n:=n div k;
                if j<10 then ch:=char(j+48)
                        else ch:=char(j+55);
                str:=str+ch;
                end;
        turn:=str;
        end;
function hw(n:longint):longint;
        var i,j,k:longint;t:string;b:boolean;
        begin
        k:=0;
        for i:=f to l do
                begin
                if n<i then inc(k)
                else begin
                if i=10 then str(n,t)
                        else
                        t:=turn(n,i);
                b:=true;j:=0;
                for j:=1 to length(t)div 2 do
                        if t[j]<>t[length(t)-j+1]then begin b:=false;break;end;
                if b then inc(k);end;
                end;
        hw:=k;
        end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
read(s,e,f,l);
if s<l-1 then s:=l-1;
for i:=trunc(sqrt(s)) to trunc(sqrt(e)) do
        begin
        k:=hw(i*i);
        if k=1 then inc(sum);
        end;
writeln(sum);
close(input);
close(output);
end.
