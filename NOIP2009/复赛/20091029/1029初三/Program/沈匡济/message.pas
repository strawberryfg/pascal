var n,i,k,x,y,j:longint;
    a,h:array[1..1000,1..1000]of shortint;
    p:boolean;
function work(b,c,dep:longint):boolean;
        var i:longint;
        begin
        if dep>n then exit(false);
        if h[b,c]=1 then exit(true);
        if h[b,c]=2 then exit(false);
        if b=c then exit(true)
               else begin
                    for i:=1 to n do
                        if a[b,i]=1 then if work(i,c,dep+1) then begin h[b,c]:=1;exit(true);end;
                    h[b,c]:=2;
                    exit(false);
                    end;
        end;
begin
assign(input,'message.in');reset(input);
assign(output,'message.out');rewrite(output);
readln(n,k);
for i:=1 to k do
        begin
        readln(x,y);
        a[x,y]:=1;
        end;
for i:=1 to n do
        begin
        p:=false;
        for j:=1 to n do
            if a[i,j]=1 then if work(j,i,1) then begin p:=true;writeln('T');break;end;
        if p then continue else writeln('F');
        end;
close(input);
close(output);
end.
