var max,min,t,s:string;
    n,i,j,l:integer;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
n:=length(s);
for i:=1 to n do
    if s[i]=' ' then begin
                     for j:=1 to i-1 do
                         begin
                         max:=max+s[j];
                         min:=min+s[j];
                         end;
                     break;
                     end;
    l:=1;
    for i:=1 to n do
        if(s[i]=' ')  then begin
                           for j:=l to i-1 do
                               t:=t+s[j];
                           if length(t)>length(max) then max:=t;
                           if length(t)<length(min) then if (t<>'') then min:=t;
                              t:='';
                              l:=i+1;
                           end
                      else begin
                             if i=n then begin
                                         for j:=l to i do
                                             t:=t+s[j];
                                         if length(t)>length(max) then begin
                                                                          max:=t;
                                                                          t:='';
                                                                          end;
                                         if length(t)<length(min) then begin
                                                                          if (t<>'') then min:=t;
                                                                          t:=''
                                                                          end;
                                         end;
                              end;
writeln(max);
writeln(min);
close(input);
close(output);
end.
