var
        i,j,a,b,c,d,n,t:longint;
function check(t:string):boolean;
var
        i:longint;
begin
        for i:=1 to length(t) div 2 do
                if t[i]<>t[length(t)+1-i] then
                        exit(false);
        exit(true);
end;
function change(s,k:longint):string;
var
        t:string;
        c:char;
        i,n:longint;
begin
        t:='';
        while s>0 do
        begin
                n:=s mod k;
                if n>=10 then
                        c:=chr(n+55)
                else    c:=chr(n+48);
                t:=c+t;
                s:=s div k;
        end;
        exit(t);
end;
begin                                    
        assign(input,'base.in');
        assign(output,'base.out');
        reset(input);
        rewrite(output);                  
        t:=0;
        read(a,b,c,d);
        if trunc(sqrt(a))<sqrt(a) then
                a:=trunc(sqrt(a))+1
        else    a:=trunc(sqrt(a));
        b:=trunc(sqrt(b));
        for i:=a to b do
                begin
                        n:=0;
                        for j:=c to d do
                                if check(change(i*i,j)) then
                                begin
                                        inc(n);
                                        if n>1 then break;
                                end;
                        if n=1 then
                                inc(t);
                end;
        writeln(t);
        close(input);
        close(output);
end.
