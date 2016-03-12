var n,t:longint;
    a,b:string;
procedure charcom(b:string);
 var s:longint;
     c:char;
 begin
 s:=length(b);
 if a=b then writeln(t)
        else if ord(b[s])<n+65-1 then begin inc(t);charcom(b+char(ord(b[s])+1))end
                                 else begin c:=b[length(b)-1];
                                            delete(b,s-1,2);
                                            inc(t);
                                            charcom(b+char(ord(c)+1))
                                      end;
 end;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(a);
t:=1;
b:='A';
charcom(b);
close(input);
close(output);
end.
