var
        s1,e1,s2,e2,k,i,j,sum,f:longint;
        s:string;

procedure change(n,y:longint);
var m:longint;
    st:string;
begin
        if n<>0 then
        begin
                m:=n mod y; change(n div y,y)
        end;
        if m<10 then str(m,st)
                else st:=chr(ord('A')+m-10);
        s:=s+st
end;

function test(st:string):boolean;
var i,j:longint;
begin
        j:=length(st); i:=1;
        while i<j do
           if st[i]<>st[j] then exit(false)
                           else begin
                                  inc(i); dec(j)
                                end;
        test:=true
end;

begin
        assign(input,'base.in'); assign(output,'base.out');
        reset(input); rewrite(output);
        readln(s1,e1,s2,e2); sum:=0;
        for i:=trunc(sqrt(s1))to trunc(sqrt(e1)) do
        begin
                for j:=s2 to e2 do
                begin
                        s:='';
                        change(sqr(i),j); if not(test(s)) then continue;
			for k:=s2 to e2 do
			f:=0; s:='';
			begin
			  	change(sqr(i),k); if not(test(s)) then continue;
				inc(f);
			end;
                        if f=1 then inc(sum)
                end;
        end;
        writeln(sum);
        close(input); close(output)
end.
