const maxn=1000;
var n,i,j,k,last,topa,topb,sum:longint;
    a:array[1..maxn]of longint;
    edge:array[1..maxn,0..maxn]of longint;
    sta,x,y:array[1..maxn]of longint;
    pd,flag:boolean;
    ch:char;
procedure dfs(num,key:longint);
var i:longint;
begin
if (sta[num]<>0) then
   begin
   if key<>sta[num] then flag:=false;
   exit;
   end;
sta[num]:=key;
for i:=1 to edge[num,0] do
    begin
    dfs(edge[num,i],3-key);
    end;
end;
begin
assign(input,'twostack.in');
reset(input);
assign(output,'twostack.out');
rewrite(output);
readln(n);
for i:=1 to n do read(a[i]);
for i:=1 to n-2 do
    begin
    for j:=i+1 to n-1 do
        begin
        if a[i]<a[j] then
           begin
           pd:=false;
           for k:=j+1 to n do
               if a[k]<a[i] then begin pd:=true;break; end;
           if pd then
              begin
              inc(edge[i,0]); edge[i,edge[i,0]]:=j;
              inc(edge[j,0]); edge[j,edge[j,0]]:=i;
              end;
           end;
        end;
    end;
for i:=1 to n do
    begin
    flag:=true;
    if edge[i,0]=0 then sta[i]:=1
       else begin
            if sta[i]=0 then
               begin
               sta[i]:=1;
               for j:=1 to edge[i,0] do
                   begin
                   dfs(edge[i,j],3-sta[i]);
                   if not flag then break;
                   end;
               if not flag then break;
               end;
            end;
    end;
if not flag then writeln(0)
   else begin
        last:=0;  sum:=0;
        for i:=1 to n do
            begin
            if sta[i]=1 then
               begin
                inc(topa); x[topa]:=a[i];
                write('a ');
                inc(sum);
               end
            else
               begin
                inc(topb); y[topb]:=a[i];
                write('c ');
                inc(sum);
               end;
            while (topa>0)and(x[topa]=last+1) do
               begin
                write('b');
                inc(sum);
                if sum<2*n then write(' ');
                x[topa]:=0; dec(topa);
                inc(last);
               end;
            while (topb>0)and(y[topb]=last+1) do
               begin
                write('d');
                inc(sum);
                if sum<2*n then write(' ');
                y[topb]:=0; dec(topb);
                inc(last);
               end;
            end;
        while (topa>0)and(x[topa]=last+1) do
           begin
            write('b');
            inc(sum);
            if sum<2*n then write(' ');
            x[topa]:=0; dec(topa);
            inc(last);
           end;
        while (topb>0)and(y[topb]=last+1) do
           begin
            write('d');
            inc(sum);
            if sum<2*n then write(' ');
            y[topb]:=0; dec(topb);
            inc(last);
           end;
        writeln;
        end;
close(input);
close(output);
end.