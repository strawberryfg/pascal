var len,n,p,s:longint;
begin
     assign(input,'broj.in');
     reset(input);
     readln(n);
     close(input);
     s:=0;
     p:=1;
     len:=1;
     while n>=p*10 do
     begin
          s:=s+len*p*9;
          p:=p*10;
          len:=len+1
     end;
     s:=s+(n-p+1)*len;
     assign(output,'broj.out');
     rewrite(output);
     writeln(s);
     close(output)
end.