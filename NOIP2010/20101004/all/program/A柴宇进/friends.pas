type ttype=array[0..9] of longint;
var st,num:string;
    n,i,j:longint;
    p:boolean;
    h1,h2:ttype;
procedure check;
  var i:longint; b:boolean;
  begin
    b:=true;
    for i:=0 to 9 do
      if ((h1[i]=0) and (h2[i]<>0)) or
         ((h1[i]<>0) and (h2[i]=0))
      then b:=false;
    p:=p or b;
  end;
procedure doit(st:string; var h:ttype);
  var x,y,i,j,tx,ty:longint;
  begin
    i:=1;
    x:=ord(st[i])-ord('0');
            y:=ord(st[i+1])-ord('0');
            tx:=x-1; ty:=y+1;
            if (tx>0) and (ty<=9) and (tx<=9) and (ty>=0)
            then begin inc(h[tx]); inc(h[ty]);
                       dec(h[x]);  dec(h[y]);
                       check;
                       dec(h[tx]); dec(h[ty]);
                       inc(h[x]);  inc(h[y]);
                 end;
            tx:=x+1; ty:=y-1;
            if (tx>0) and (ty<=9) and (tx<=9) and (ty>=0)
            then begin inc(h[tx]); inc(h[ty]);
                       dec(h[x]);  dec(h[y]);
                       check;
                       dec(h[tx]); dec(h[ty]);
                       inc(h[x]);  inc(h[y]);
                 end;
    i:=2;
    while (i<=length(st)-1) and (p=false) do
      begin x:=ord(st[i])-ord('0');
            y:=ord(st[i+1])-ord('0');
            tx:=x-1; ty:=y+1;
            if (tx>=0) and (ty<=9) and (tx<=9) and (ty>=0)
            then begin inc(h[tx]); inc(h[ty]);
                       dec(h[x]);  dec(h[y]);
                       check;
                       dec(h[tx]); dec(h[ty]);
                       inc(h[x]);  inc(h[y]);
                 end;
            tx:=x+1; ty:=y-1;
            if (tx>=0) and (ty<=9) and (tx<=9) and (ty>=0)
            then begin inc(h[tx]); inc(h[ty]);
                       dec(h[x]);  dec(h[y]);
                       check;
                       dec(h[tx]); dec(h[ty]);
                       inc(h[x]);  inc(h[y]);
                 end;
            inc(i);
      end;
  end;
procedure int;
  begin
    readln(n);
    for i:=1 to n do
      begin readln(st);
            while st[1]=' ' do delete(st,1,1);
            j:=1;
            while st[j]<>' ' do inc(j);
            num:=copy(st,1,j-1);
            delete(st,1,j);
            j:=1;
            while st[j]<>' ' do inc(j);
            j:=length(st);
            while st[j]=' ' do
              begin delete(st,j,1);
                    dec(j);
              end;
            fillchar(h1,sizeof(h1),0);
            fillchar(h2,sizeof(h2),0);
            for j:=1 to length(num) do
              begin inc(h1[ord(num[j])-ord('0')]);
              end;
            for j:=1 to length(st) do
              begin inc(h2[ord(st[j])-ord('0')]);
              end;
            p:=false;
            check;
            if p=true
            then writeln('friends')
            else begin
                   p:=false;
                   doit(num,h1);
                   if p=false then doit(st,h2);
                   if p=true then writeln('almost friends')
                             else writeln('nothing');
                 end;
      end;
  end;

begin
assign(input,'friends.in');
reset(input);
assign(output,'friends.out');
rewrite(output);

  int;

close(input);
close(output);
end.
