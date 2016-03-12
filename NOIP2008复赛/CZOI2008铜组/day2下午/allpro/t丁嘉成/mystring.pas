var n,max,min:string;

procedure start;
begin
assign(input,'mystring.in');reset(input);
assign(output,'mystring.out');rewrite(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
begin
readln(n)
end;

procedure outt;
begin
writeln(max);
writeln(min);
end;

procedure runit;
var i:longint;
    t:string;
begin
while i<>length(n) do
  begin
    if n[i]<>' ' then begin
                        t:=t+n[i];
                      end
                 else begin
                        if length(t)>length(max) then begin
                                                        max:='';
                                                        max:=max+t;
                                                        t:='';
                                                      end
                                                 else begin
                                                        t:='';
                                                      end;
                        if length(t)<length(min) then begin
                                                        min:='';
                                                        min:=min+t;
                                                        t:='';
                                                      end
                                                 else begin
                                                        t:='';
                                                      end;

                      end;
    inc(i)
  end;
end;

begin
start;
intt;
runit;
outt;
endit;
end.
