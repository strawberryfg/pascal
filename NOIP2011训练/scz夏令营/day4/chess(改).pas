var i,j,n,m,tot1,tot2,t1,t2,total1,total2:longint;
        a:array[0..1001,0..1001]of char;
        p:boolean;

procedure try(ch:char);
  var i,t,total,j:longint;
  begin
  for i:=1 to n do
        begin
        t:=1;
        while t<=n do
                begin
                while (a[i,t]<>ch)and(t<=n) do inc(t);
                total:=0;
                while (a[i,t]=ch)and(t<=n) do
                        begin
                        inc(total);inc(t);
                        end;
                if total=m then if tot1=0 then begin
                                               tot1:=1;
                                               for j:=t-1 downto t-m do
                                                a[i,j]:='.';
                                               end
                                          else begin
                                               tot1:=-2;
                                               exit;
                                               end;
                if total>m then
                        begin
                        tot1:=-2;exit;
                        end;
                end;
        end;
  for i:=1 to n do
        begin
        t:=1;
        while t<=n do
                begin
                while (a[t,i]<>ch)and(t<=n) do inc(t);
                total:=0;
                while (a[t,i]=ch)and(t<=n) do
                        begin
                        inc(total);inc(t);
                        end;
                if total=m then if tot1=0 then begin
                                               tot1:=1;
                                               for j:=t-1 downto t-m do
                                                a[j,i]:='.';
                                               end
                                          else begin
                                               tot1:=-2;
                                               exit;
                                               end;
                if total>m then
                        begin
                        tot1:=-2;exit;
                        end;
                end;
        end;
  t:=1;
  while t<=n do
                begin
                while (a[t,t]<>ch)and(t<=n) do inc(t);
                total:=0;
                while (a[t,t]=ch)and(t<=n) do
                        begin
                        inc(total);inc(t);
                        end;
                if total=m then if tot1=0 then begin
                                               tot1:=1;
                                               for j:=t-1 downto t-m do
                                                a[j,j]:='.';
                                               end
                                          else begin
                                               tot1:=-2;
                                               exit;
                                               end;
                if total>m then
                        begin
                        tot1:=-2;exit;
                        end;
                end;
  t:=1;
  while t<=n do
                begin
                while (a[t,n-t+1]<>ch)and(t<=n) do inc(t);
                total:=0;
                while (a[t,n-t+1]=ch)and(t<=n) do
                        begin
                        inc(total);inc(t);
                        end;
                if total=m then if tot1=0 then begin
                                               tot1:=1;
                                               for j:=t-1 downto t-m do
                                                a[j,n-j+1]:='.';
                                               end
                                          else begin
                                               tot1:=-2;
                                               exit;
                                               end;
                if total>m then
                        begin
                        tot1:=-2;exit;
                        end;
                end;
  end;

begin
assign(input,'chess.in');
reset(input);
assign(output,'chess.out');
rewrite(output);
readln(n,m);
p:=false;
for i:=1 to n do
        begin
        for j:=1 to n do
                begin
                read(a[i,j]);
                if a[i,j]='.' then p:=true;
                if a[i,j]='X' then inc(total1);
                if a[i,j]='O' then inc(total2);
                end;
        readln;
        end;
if total2>total1 then begin writeln('ERROR');close(input);close(output);halt; end;
tot1:=0;try('X');
t1:=tot1;
tot1:=0;try('O');
t2:=tot1;
if (t1=-2)or(t2=-2) then writeln('ERROR');
if (t1=1)and(t2=1) then writeln('ERROR');
if not p then if (t1=0)and(t2=0) then writeln('DRAW');
if p then if (t1=0)and(t2=0) then writeln('IN PROGRESS');
if (t1=1)and(t2=0) then writeln('X WINS');
if (t1=0)and(t2=1) then writeln('O WINS');
close(input);
close(output);
end.