{
ID: xiaweiy1
PROG: checker
LANG: PASCAL
}
var sums,sumss,n,t,i,j,k:longint;
    a,x,ne,nw:array[0..26]of longint;
    s,ss:array[1..5,0..26]of longint;
procedure print;
var i:longint;
begin
if t<n div 2+1 then begin inc(sums); if sums<=3 then for i:=1 to n do s[sums,i]:=a[i];
                    end
               else begin inc(sumss);{for i:=1 to n do ss[sumss,i]:=a[i];} end;
end;
procedure produce(dep:longint);
var i:longint;
begin
if dep>n then print
   else begin
        if dep=1 then begin a[1]:=t;x[t]:=1;ne[dep+t]:=1;nw[dep-t+n]:=1;produce(dep+1);end
           else
           for i:=1 to n do
               begin
               if (x[i]=0)and(ne[dep+i]=0)and(nw[dep-i+n]=0) then
                  begin
                  a[dep]:=i;
                  x[i]:=1; ne[dep+i]:=1; nw[dep-i+n]:=1;
                  produce(dep+1);
                  x[i]:=0; ne[dep+i]:=0; nw[dep-i+n]:=0;
                  end;
               end;
        end;
end;
begin
assign(input,'checker.in');
reset(input);
assign(output,'checker.out');
rewrite(output);
readln(n);
if n mod 2=0 then k:=n div 2 else k:=n div 2+1;
for i:=1 to k do
    begin
    fillchar(a,sizeof(a),0); fillchar(x,sizeof(x),0);
    fillchar(ne,sizeof(ne),0); fillchar(nw,sizeof(nw),0);
    t:=i;
    produce(1);
    end;
if sums>2 then for i:=1 to 3 do
                   begin
                   for j:=1 to n do
                        begin write(s[i,j]);if j<n then write(' '); end;
                   writeln;
                   end
          else begin
               for i:=1 to 2 do
                   begin
                   for j:=1 to n do
                       begin
                        write(s[i,j]);
                        if j<n then write(' ');
                       end;
                   writeln;
                   end;
               for i:=n downto 1 do
                   begin
                   write(s[2,i]);
                   if i>1 then write(' ');
                   end;
               writeln;
               end;
if n mod 2=0 then write(sums*2) else write(sums*2+sumss);
writeln;
close(input);
close(output);
end.
