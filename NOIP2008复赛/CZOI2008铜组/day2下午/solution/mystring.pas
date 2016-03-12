program mystring;
var
  str,temp,maxstr,minstr:string;
  maxlen,minlen,p,len:integer;

begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);

  readln(str);
  maxlen:=0;
  minlen:=300;
  p:=pos(' ',str);
  while p<>0 do
  begin
    temp:=copy(str,1,p-1);
    len:=length(temp);
    if maxlen<len
    then begin
           maxlen:=len;
           maxstr:=temp;
         end;
    if minlen>len
    then begin
           minlen:=len;
           minstr:=temp;
         end;
    delete(str,1,p);
    p:=pos(' ',str);
  end;
  len:=length(str);
  if maxlen<len
  then maxstr:=str;
  if minlen>len
  then minstr:=str;
  writeln(maxstr);
  writeln(minstr);

  close(input);
  close(output);
end.