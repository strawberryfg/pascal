program align;
type
  str=string[50];
var
  x,y:str;


function get(x,y:str):str;
var
  i:longint;
begin
  i:=length(x);
  repeat
    dec(i);
  until (i<=0) or (x[i]=y[length(y)]);
  get:=copy(x,1,i);
end;

function try(x,y:str):longint;
var
  m,n,o:longint;
begin
  if (x='') and (y<>'')
    then try:=-1
    else
      if y='' then try:=0
              else
                if x[length(x)]=y[length(y)]
                  then try:=2+try(copy(x,1,length(x)-1),copy(y,1,length(y)-1))
                  else begin
                         m:=try(get(x,y),y)-1;
                         n:=try(x,get(y,x))-1;
                         o:=try(copy(x,1,length(x)-1),copy(y,1,length(y)-1));
                         if m>n then if m>o then try:=m
                                            else try:=o
                                else if n>o then try:=n
                                            else try:=o;
                       end;
end;

begin
  assign (input,'align.in');
  reset(input);
  assign (output,'align.out');
  rewrite(output);
  readln (x);
  readln (y);
  writeln (try(x,y));
  close(input);
  close(output);
end.