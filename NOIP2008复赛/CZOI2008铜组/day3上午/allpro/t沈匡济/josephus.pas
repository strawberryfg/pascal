type arr=array[1..30]of longint;
var k,m,i,j,s,n:longint;
    p:boolean;
    a:arr;
    b:array[1..30]of boolean;
function jia(s,j,n:longint):longint;
        var tj:longint;
        begin
        tj:=j;
        while tj>0 do
                begin
                s:=(s+1)mod n;
                if s=0 then s:=n;
                tj:=tj-a[s];
                end;
        jia:=s;
        end;
function zhao(a:arr):boolean;
        var i:longint;
        begin
        zhao:=true;
        for i:=k+1 to n do
                if a[i]<>0 then begin zhao:=false;exit;end;
        end;
begin
assign(input,'josephus.in');reset(input);
assign(output,'josephus.out');rewrite(output);
readln(k);
j:=k;
n:=2*k;
while 1>0 do
        begin
        for i:=1 to 2*k do
                a[i]:=1;
        fillchar(b,sizeof(b),false);
        s:=0;
        inc(j);
        p:=false;
        while not p do
                begin
                s:=jia(s,j,n);
                if b[s] then begin p:=false;break;end;
                a[s]:=0;
                b[s]:=true;
                if s<=k then if zhao(a) then begin writeln(j);close(input);close(output);halt;end
                                        else break
                        else p:=false;
                end;
        end;
end.
