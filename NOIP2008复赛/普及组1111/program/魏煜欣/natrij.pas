var a1,a2,b1,b2,c1,c2:longint;
    t1,t2:string;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(t1);
readln(t2);
val(copy(t1,1,2),a1);
val(copy(t1,4,2),b1);
val(copy(t1,7,2),c1);
val(copy(t2,1,2),a2);
val(copy(t2,4,2),b2);
val(copy(t2,7,2),c2);
if c1>c2 then begin
              c2:=c2+60;
              dec(b2);
              end;
if b1>b2 then begin
              b2:=b2+60;
              dec(a2);
              end;
if a1>a2 then a2:=a2+24;
if (c2-c1<10) and (b2-b1<10) and (a2-a1<10) then
        begin
        writeln('0',a2-a1,':0',b2-b1,':0',c2-c1);
        close(input);
        close(output);
        exit;
        end;
if (b2-b1<10) and (a2-a1<10) then
        begin
        writeln('0',a2-a1,':0',b2-b1,':',c2-c1);
        close(input);
        close(output);
        exit;
        end;
if (c2-c1<10) and (a2-a1<10) then
        begin
        writeln('0',a2-a1,':',b2-b1,':0',c2-c1);
        close(input);
        close(output);
        exit;
        end;
if (c2-c1<10) and (b2-b1<10) then
        begin
        writeln(a2-a1,':0',b2-b1,':0',c2-c1);
        close(input);
        close(output);
        exit;
        end;
if c2-c1<10 then
        begin
        writeln(a2-a1,b2-b1,':0',c2-c1);
        close(input);
        close(output);
        exit;
        end;
if b2-b1<10 then
        begin
        writeln(a2-a1,':0',b2-b1,':',c2-c1);
        close(input);
        close(output);
        exit;
        end;
if a2-a1<10 then
        begin
        writeln('0',a2-a1,':',b2-b1,':',c2-c1);
        close(input);
        close(output);
        exit;
        end;
writeln(a2-a1,':',b2-b1,':',c2-c1);
close(input);
close(output);
end.
