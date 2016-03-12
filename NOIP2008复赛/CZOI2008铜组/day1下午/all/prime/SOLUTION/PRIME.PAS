const
        maxn=20;

var
        stack:array[1..maxn]of longint;
        hex:array[1..maxn]of boolean;
        prime:array[1..maxn*2]of boolean;
        n:longint;

procedure setup;
begin
        assign(input,'prime.in');
        assign(output,'prime.out');
        reset(input);
        rewrite(output);
end;

procedure endit;
begin
        close(input);
        close(output);
end;

procedure init;
begin
        read(n);
end;

procedure creat;
var
        i,j:longint;
begin
        fillchar(prime,sizeof(prime),0);
        prime[1]:=true;
        for i:=1 to n do if not prime[i] then
        begin
                j:=i;
                while j<=2*n-i do
                begin
                        inc(j,i);
                        prime[j]:=true;
                end;
        end;
end;

procedure work;
var
        i,top:longint;
begin
        fillchar(hex,sizeof(hex),0);
        fillchar(stack,sizeof(stack),0);
        stack[1]:=1;
        top:=2;
        hex[1]:=true;
        while top>1 do
        begin
                repeat
                        inc(stack[top]);
                until (stack[top]>n) or ((not hex[stack[top]]) and (not prime[stack[top]+stack[top-1]]));
                if stack[top]>n then
                begin
                        stack[top]:=1;
                        dec(top);
                        hex[stack[top]]:=false;
                end
                else if top=n then
                begin
                        if (not prime[stack[n]+1]) then
                        begin
                                for i:=1 to n do
                                begin
                                        if i>1 then write(' ');
                                        write(stack[i]);
                                end;
                                writeln;
                        end;
                end
                else
                begin
                        hex[stack[top]]:=true;
                        inc(top);
                end;
        end;
end;

begin
        setup;
        init;
        creat;
        work;
        endit;
end.
