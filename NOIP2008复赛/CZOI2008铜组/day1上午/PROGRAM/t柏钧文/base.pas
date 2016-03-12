type arr=array[1..1000]of char;
var dep,a,b,c,d1,i,j,total,sum:longint;
    d:arr;

procedure jin1(a,b:longint);
  var i,t1,j:longint;
        c:array[1..1000]of char;
  begin
  t1:=a;
  i:=1;
  while t1>0  do
        begin
        if t1 mod b<10 then c[i]:=char((t1 mod b)+48)
                        else c[i]:=char((t1 mod b)-9+64);
        t1:=t1 div b;
        inc(i);
        end;
  for j:=i-1 downto 1 do
        d[i-j]:=c[j];
  dep:=i-1;
  end;
function pan(d:arr;dep:longint):boolean;
  var e:arr;
        i:longint;
        p:boolean;
  begin
  for i:=dep downto 1 do
      e[i]:=d[i];
  p:=true;
  for i:=1 to dep do
        if e[i]=d[j] then begin p:=false;exit; end;
  end;

  begin
  assign(input,'base.in') ;
  reset(input);
  assign(output,'base.out');
  rewrite(output);
  read(a,b,c,d1);
  for i:=a to b do
     begin
     sum:=0;
      for j:=c to d1 do
          begin
          jin1(i*i,j);
          if pan(d,dep) then  inc(sum);
          end;
      if sum=1 then inc(total);
      end;
  writeln(total);
 close(input);
close(output); 
end.
