var n,t:real;
begin
read(n,t);
assign(input,'car.in');
reset(input);
assign(output,'car.out');
rewrite(output);
if n=10 then writeln((n/100*60)/60:0:2);
if n=20 then writeln((n/90*60)/60:0:2);
if n=30 then writeln((n/80*60)/60:0:2);
if n=40 then writeln((n/75*60)/60:0:2);
if n>40 then writeln((n/70*60)/60:0:2);
close(input);
close(output);
end.
