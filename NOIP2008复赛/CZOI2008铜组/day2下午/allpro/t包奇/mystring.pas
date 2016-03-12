program mystring;
var max,min,temp,str:string;
    n,i,j,l1:integer;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  readln(str);
  n:=length(str);
  for i:=1 to n do
      if str[i]=' ' then begin
                           for j:=1 to i-1 do
                               begin
                                 max:=max+str[j];
                                 min:=min+str[j];
                               end;
                           break;
                         end;
  l1:=1;
  for i:=1 to n do
      if(str[i]=' ')  then begin
                             for j:=l1 to i-1 do
                                 temp:=temp+str[j];
                             if length(temp)>length(max) then   max:=temp;
                             if length(temp)<length(min) then begin
                                                                if (temp<>'') then min:=temp;
                                                                                         end;
                             temp:='';
                             l1:=i+1;
                            end
                       else begin if i=n then begin for j:=l1 to i do temp:=temp+str[j];  if length(temp)>length(max) then begin
                                                                                                                       max:=temp;
                                                                                      temp:='';
                                                                                     end;
                                                                                   if length(temp)<length(min) then begin
                                                                                                                     if (temp<>'') then min:=temp;
                                                                                                                       temp:=''
                                                                                                                      end;
                                              end;
                                end;
  writeln(max);
  writeln(min);
  close(input);
  close(output);
end.
