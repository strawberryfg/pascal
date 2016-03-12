program pro2;
  type
    prr=^rec;
    rec=record
          l,r,cc:longint;
          re:boolean;
          left,right:prr
        end;
  var
    h:prr;
    c,r,s:longint;
  procedure setfile;
    begin
      assign(input,'railway.in');
      assign(output,'railway.out');
      reset(input);
      rewrite(output);
    end;
  procedure build(var p:prr; st,en:longint);
    begin
      p^.l:=st;
      p^.r:=en;
      p^.re:=false;
      p^.cc:=0;
      if en-st>1 then
        begin
          new(p^.left);
          build(p^.left,st,(st+en)div 2);
          new(p^.right);
          build(p^.right,(st+en)div 2,en)
        end
      else
        begin
          p^.left:=nil;
          p^.right:=nil
        end
    end;
  function max(x,y:longint):longint;
    begin
      if x>y then
        max:=x
      else
        max:=y
    end;
  function min(x,y:longint):longint;
    begin
      if x>y then
        min:=y
      else
        min:=x
    end;
  function ok(p:prr; st,en,e:longint):boolean;
    var
      flag:boolean;
    begin
      if p^.cc>e then
        begin
          ok:=false;
          exit
        end;
      flag:=true;
      if (p^.left<>nil)and(p^.left^.re<>false)and(st<(p^.l+p^.r)div 2) then
        flag:=ok(p^.left,st,min((p^.l+p^.r)div 2,en),e-p^.cc);
      if flag and (p^.right<>nil) and (p^.right^.re<>false) and (en>=(p^.l+p^.r)div 2+1) then
        flag:=ok(p^.right,max(st,(p^.l+p^.r)div 2),en,e-p^.cc);
      ok:=flag
    end;
  procedure ins(var p:prr; st,en,e:longint);
    begin
      p^.re:=true;
      if (p^.r=en)and(p^.l=st) then
        begin
          inc(p^.cc,e);
          exit
        end;
      if (p^.left<>nil)and(st<(p^.l+p^.r)div 2) then
        ins(p^.left,st,min((p^.l+p^.r)div 2,en),e);
      if (p^.right<>nil)and(en>=(p^.l+p^.r)div 2+1) then
        ins(p^.right,max((p^.l+p^.r)div 2,st),en,e)
    end;


  procedure main;
    var
      i,j,k,o,d,n:longint;
    begin
      setfile;
      read(c,s,r);
      new(h);
      build(h,1,c);
      for i:=1 to r do
        begin
          read(o,d,n);
          if ok(h,o,d,s-n) then
            begin
              ins(h,o,d,n);
              writeln('YES')
            end
          else
            begin
              writeln('NO')
            end
        end;
      close(output);
      close(input)
    end;
  begin
    main
  end.
