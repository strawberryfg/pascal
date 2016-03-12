var f:array[0..400] of boolean;
    d,num,nextit:array[0..400] of longint;
    q:array[0..2000] of longint;
    g:array[0..400,0..400] of record time,adj:longint; end;
    t,n,m,ques,i,u,v,ww:longint;
function spfa:longint;
  var linkit,h,t,i,j,kv,kt:longint;
  begin
    q[1]:=u;
    h:=1; t:=1;
    fillchar(f,sizeof(f),false);
    fillchar(d,sizeof(d),127);
    d[u]:=0;
    f[u]:=true;
    while h<=t do
      begin j:=q[h];
            linkit:=nextit[j];
            for i:=1 to linkit do
              begin kv:=g[j,i].adj; kt:=g[j,i].time;
                    if  ((num[kv]<=ww) or (kv=v)) and (d[kv]-kt>d[j])
                    then begin 
                               if f[kv]=false
                               then begin inc(t);
                                          q[t]:=kv; f[kv]:=true;
                                    end;
                               
                               d[kv]:=d[j]+kt;
                         end;
              end;
            f[j]:=false;
            inc(h);
      end;
    if d[v]=2139062143 then d[v]:=-1;
    spfa:=d[v];
  end;


procedure int;
  begin
    readln(n,m);
    for i:=0 to n-1 do
      read(num[i]);   readln;
    fillchar(nextit,sizeof(nextit),0);
    for i:=1 to m do
      begin readln(u,v,t);
            inc(nextit[u]);
            g[u,nextit[u]].adj:=v;
            g[u,nextit[u]].time:=t;
            inc(nextit[v]);
            g[v,nextit[v]].adj:=u;
            g[v,nextit[v]].time:=t;
      end;
    readln(ques);
    for i:=1 to ques do
      begin readln(u,v,ww);
            writeln(spfa);
      end;
  end;

begin
assign(input,'escape.in');
reset(input);
assign(output,'escape.out');
rewrite(output);

  int;

close(input);
close(output);
end.
