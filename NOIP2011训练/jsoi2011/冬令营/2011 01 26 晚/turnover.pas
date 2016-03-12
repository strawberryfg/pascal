program turnover;
type
  pointer=^node;
  node=record
         data:longint;
         lc,rc,parent:pointer;
       end;
var
  x,y,root,root2,t,p:pointer;
  i,n,n1,n2,num,min:longint;
procedure zig(x:pointer);
  begin
    y:=x^.parent;
    x^.parent:=y^.parent;
    if y^.parent^.lc=y then
      y^.parent^.lc:=x
    else
      y^.parent^.rc:=x;
    y^.lc:=x^.rc;
    if x^.rc<>nil then x^.rc^.parent:=y;
    y^.parent:=x;
    x^.rc:=y;
  end;
procedure zag(x:pointer);
  begin
    y:=x^.parent;
    x^.parent:=y^.parent;
    if y^.parent^.lc=y then
      y^.parent^.lc:=x
    else
      y^.parent^.rc:=x;
    y^.rc:=x^.lc;
    if x^.lc<>nil then x^.lc^.parent:=y;
    y^.parent:=x;
    x^.lc:=y;
  end;
procedure splay(x:pointer);
  begin
    while x^.parent<>root2 do
      begin
        if x^.parent^.parent=root2 then
          begin
            if x=x^.parent^.lc then zig(x) else zag(x)
          end
        else
          begin
            y:=x^.parent;
            if (y^.lc=x)and(y^.parent^.lc=y) then begin zig(x);zig(x);end
            else if (y^.rc=x)and(y^.parent^.lc=y) then begin zag(x);zig(x);end
            else if (y^.lc=x)and(y^.parent^.rc=y) then begin zig(x);zag(x);end
            else begin zag(x);zag(x);end;
          end;
      end;
  end;
procedure insert(x:pointer;num:longint);
  begin
    if x^.data=0 then
      begin
        x^.data:=num;
        splay(x);
      end
    else
      begin
        if x^.data>num then
          begin
            if x^.lc=nil then
              begin
                new(x^.lc);x^.lc^.data:=0;x^.lc^.parent:=x;
                x^.lc^.lc:=nil;x^.lc^.rc:=nil;
              end;
            insert(x^.lc,num);
          end
        else
          begin
            if x^.rc=nil then
              begin
                new(x^.rc);x^.rc^.data:=0;x^.rc^.parent:=x;
                x^.rc^.lc:=nil;x^.rc^.rc:=nil;
              end;
            insert(x^.rc,num);
          end;
       end;
  end;
function findpre(p:pointer):longint;
  begin
    while p^.rc<>nil do
      p:=p^.rc;
    findpre:=p^.data;
  end;
function findsucc(p:pointer):longint;
  begin
    while p^.lc<>nil do
      p:=p^.lc;
    findsucc:=p^.data;
  end;
begin
  assign(input,'turnover.in');reset(input);
  assign(output,'turnover.out');rewrite(output);
  readln(n);
  new(root);new(root2);
  readln(num);
  root^.parent:=root2;
  root^.data:=num;
  root^.lc:=nil;
  root^.rc:=nil;
  root2^.lc:=root;
  root2^.rc:=nil;
  writeln(num);
  for i:=2 to n do
    begin
      min:=maxlongint;
      readln(num);
      insert(root2^.lc,num);
      n1:=0;n2:=0;
      x:=root2^.lc;
      if x^.lc<>nil then n1:=findpre(x^.lc);
      if x^.rc<>nil then n2:=findsucc(x^.rc);
      if (n1<>0)and(num-n1<min) then min:=num-n1;
      if (n2<>0)and(n2-num<min) then min:=n2-num;
      writeln(min);
    end;
  close(input);
  close(output);
end.
