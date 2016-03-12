program fire;
const maxn=10;
      limit=4;
type arrtype=array[1..maxn*maxn,0..2*maxn] of longint;
var c,count,i,n,time,max,try,x,y:longint;
    find:boolean;
    row:array[1..maxn] of string;
    link:arrtype;
    state:array[0..maxn*maxn+1] of longint;
procedure init;
var i,j,k,no,x,y:longint;
begin
  state[0]:=-1; state[n*n+1]:=-1;
  for no:=1 to n*n do
    begin
      i:=(no-1) div n+1;
      j:=(no-1) mod n+1;
      link[no,0]:=0;
      state[no]:=-1;
      if row[i,j]='.' then
        begin
          state[no]:=0;
          k:=0;
          y:=j;
          while (y<n) and (row[i,y+1]='.') do
            begin
              link[no,0]:=link[no,0]+1;
              y:=y+1;k:=k+1;
              link[no,k]:=(i-1)*n+y
            end;
          y:=j;
          while (y>1) and (row[i,y-1]='.') do
            begin
              link[no,0]:=link[no,0]+1;
              y:=y-1;k:=k+1;
              link[no,k]:=(i-1)*n+y
            end;
          x:=i;
          while (x<n) and (row[x+1,j]='.') do
            begin
              link[no,0]:=link[no,0]+1;
              x:=x+1;k:=k+1;
              link[no,k]:=(x-1)*n+j
            end;
          x:=i;
          while (x>1) and (row[x-1,j]='.') do
            begin
              link[no,0]:=link[no,0]+1;
              x:=x-1;k:=k+1;
              link[no,k]:=(x-1)*n+j
            end
        end
    end
end;
begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);
  time:=meml[$40:$6c];
  readln(n);
  for i:=1 to n do readln(row[i]);
  init;
  max:=0;
  try:=0;
  repeat
    count:=0;
    repeat
       find:=true;
       x:=random(n*n)+1;
       c:=x;
       while(x<=n*n) and (state[x]<>try) do x:=x+1;
         if state[x]<>try then
          begin
            x:=c;
            while(x>0) and (state[x]<>try) do x:=x-1
          end;
         if state[x]=try then begin
                                count:=count+1;
                                for i:=1 to link[x,0] do
                                if state[link[x,i]]=try
                                  then inc(state[link[x,i]]);
                                inc(state[x])
                              end
                         else find:=false
    until not(find);
    if count>max then max:=count;
    try:=try+1
  until meml[$40:$6c]-time>18.2*limit;
  writeln(max);
close(input);
close(output);
end.
