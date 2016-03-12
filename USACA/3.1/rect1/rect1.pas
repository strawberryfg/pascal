{
ID:xiaweiy1
LANG:PASCAL
TASK:rect1
}
program Qi(input,output);
  var
    a,b,n,k,w:integer;
    x1,x2,y1,y2,col:array[1..1000] of integer;
    pp:array[0..10000] of boolean;
    pt:array[1..2000] of integer;
    treel,treer,treec:array[1..maxint] of integer;
    ff:array[1..4000] of longint;
  procedure init;
    var
      i,j:integer;
    begin
      assign(input,'rect1.in'); reset(input);
      assign(output,'rect1.out'); rewrite(output); 
      readln(a,b,n);
      fillchar(pp,sizeof(pp),false);
      for i:=1 to n do
        begin
          readln(x1[i],y1[i],x2[i],y2[i],col[i]);
          pp[x1[i]]:=true; pp[x2[i]]:=true;
        end;
    end;
  procedure ready;
    var
      i:integer;
    begin
      fillchar(treec,sizeof(treec),0);
      treel[1]:=0; treer[1]:=16384;
      for i:=1 to 16383 do
        begin
          treel[2*i]:=treel[i];
          treer[2*i]:=(treel[i]+treer[i]) div 2;
          treel[2*i+1]:=treer[2*i];
          treer[2*i+1]:=treer[i];
        end;
    end;
  procedure insert(u:integer);
    begin
      if treec[u]>0 then exit;
      if (treel[u]>=y1[k]) and (treer[u]<=y2[k]) and (treec[u]=0) 
        then begin treec[u]:=col[k]; exit; end;
      treec[u]:=-1;
      if (y1[k]<treer[2*u]) then insert(2*u);
      if (y2[k]>treel[2*u+1]) then insert(2*u+1);
    end;
  procedure total(u:integer);
    begin
      if treec[u]=0 then exit;
      if treec[u]<>-1
        then inc(ff[treec[u]],(treer[u]-treel[u])*(pt[w+1]-pt[w]))
        else begin total(2*u); total(2*u+1); end;
      treec[u]:=0;
    end;
  procedure doit;
    var
      i,mm:integer;
    begin
      mm:=0;
      for i:=0 to 10000 do if pp[i] then begin mm:=mm+1; pt[mm]:=i; end;
      fillchar(ff,sizeof(ff),0);
      for w:=1 to mm-1 do
        begin
          for k:=n downto 1 do
            if (pt[w]>=x1[k]) and (pt[w]<x2[k]) then  insert(1);
          total(1);
        end;
    end;
  procedure print;
    var
      i:integer;
    begin
      ff[1]:=a*b;
      for i:=2 to 2000 do dec(ff[1],ff[i]);
      for i:=1 to 2000 do
        if ff[i]<>0 then writeln(i,' ',ff[i]);
      close(input); close(output);
    end;
  begin
    init;
    ready;
    doit;
    print;
  end.
