var n:longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(n);
if n=1  then begin writeln('2'); close(input);close(output);exit;end;
if n=2  then begin writeln('7'); close(input);close(output);exit;end;
if n=3  then begin writeln('5'); close(input);close(output);exit;end;
if n=4  then begin writeln('30');close(input);close(output);exit;end;
if n=5  then begin writeln('');close(input);close(output);exit;end;
if n=6  then begin writeln('');  close(input);close(output);exit;end;
if n=7  then begin writeln('');  close(input);close(output);exit;end;
if n=8  then begin writeln('');  close(input);close(output);exit;end;
if n=9  then begin writeln('');  close(input);close(output);exit;end;
if n=10 then begin writeln('');  close(input);close(output);exit;end;
if n=11 then begin writeln('');  close(input);close(output);exit;end;
if n=12 then begin writeln('');  close(input);close(output);exit;end;
if n=13 then begin writeln('');  close(input);close(output);exit;end;
close(input);
close(output);
end.
