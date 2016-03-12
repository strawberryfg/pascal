var
   i,t,n,m,ln,lm:longint;
   strn,strm,strs:string;
   k:char;
begin
 assign(input,'kolone.in');
 assign(output,'kolone.out');
 reset(input);
 rewrite(output);

 readln(n,m);
 readln(strn);
 readln(strm);
 readln(t);


 ln:=length(strn);
 lm:=length(strm);
 for i:=1 to (ln div 2+1) do
     begin
      k:=strn[i];
      strn[i]:=strn[ln-i+1];
      strn[ln-i+1]:=k;
     end;
     strs:=strn+strm;
 if t<=0 then writeln(strs)
 else writeln(strm+strn);


 close(input);
 close(output);
end.
