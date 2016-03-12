const maxl=80;
type arr=array[1..2]of extended;
var s,op:string[maxl];
    top,i:longint;
    kh,belong:array[0..maxl]of longint;
    error:boolean;
    ans:arr;
procedure print;
begin
write('[',ans[1]:0:3,',',ans[2]:0:3,']');
writeln;
end;
function getnum(st,en:longint):arr;
var tmp,ts:string[maxl];
    k:longint;
    a,b:extended;
    code:integer;
begin
tmp:=copy(s,st,en-st+1);
k:=pos(',',tmp);
ts:=copy(tmp,1,k-1);
delete(tmp,1,k);
val(ts,a,code);
val(tmp,b,code);
getnum[1]:=a; getnum[2]:=b;
end;
function min(x,y,z,w:extended):extended;
begin
min:=x; if y<min then min:=y; if z<min then min:=z; if w<min then min:=w;
exit(min);
end;
function max(x,y,z,w:extended):extended;
begin
max:=x; if y>max then max:=y; if z>max then max:=z; if w>max then max:=w;
exit(max);
end;
function calc(x:arr;sym:longint;y:arr):arr;
var a,b,tmp:arr;
    p:extended;
begin
a:=x; b:=y;
if sym=2 then begin p:=b[1]; b[1]:=-b[2]; b[2]:=-p; end;
if sym<=2 then begin tmp[1]:=a[1]+b[1]; tmp[2]:=a[2]+b[2]; end;
if sym=3 then
   begin
   tmp[1]:=min(a[1]*b[1],a[1]*b[2],a[2]*b[1],a[2]*b[2]);
   tmp[2]:=max(a[1]*b[1],a[1]*b[2],a[2]*b[1],a[2]*b[2]);
   end
else if sym=4 then
   begin
   if (b[1]<=0)and(b[2]>=0) then begin tmp[1]:=0; tmp[2]:=0; error:=true; end
      else begin
           tmp[1]:=min(a[1]/b[1],a[1]/b[2],a[2]/b[1],a[2]/b[2]);
           tmp[2]:=max(a[1]/b[1],a[1]/b[2],a[2]/b[1],a[2]/b[2]);
           end;
   end;
exit(tmp);
end;
function solve(st,en:longint):arr;
var i,j,dir,n,m,last,ta,tb:longint;
    opt,sig,ass:array[0..maxl]of longint;
    num:array[0..maxl]of arr;
    f:array[0..maxl,1..2]of longint;
    res:arr;
    mark:boolean;
begin
fillchar(opt,sizeof(opt),0);
opt[0]:=1;
fillchar(num,sizeof(num),0);
fillchar(sig,sizeof(sig),0); //sig 1 () 2 -() 3 -[]
fillchar(ass,sizeof(ass),0);
ass[0]:=st-1;
fillchar(f,sizeof(f),0);
i:=st;
n:=0; //num;
m:=0; //opt;   1:+ 2:- 3:* 4:/
dir:=0;
while i<=en do
  begin
  if belong[i]<>0 then
     begin
     inc(n); sig[n]:=1; f[n,1]:=i+1; f[n,2]:=belong[i]-1;
     if dir=1 then
        begin
        sig[n]:=2;
        dir:=0;
        end;
     i:=belong[i]+1;
     end
  else if op[i]='-' then
          begin
          if (i<>1)and((op[i-1]=']')or(op[i-1]=')')) then
             begin
             inc(m); opt[m]:=2; ass[m]:=i;

             end
          else if (i<>1)and((op[i-1]='(')or(op[i-1]='+')or(op[i-1]='-')or(op[i-1]='*')or(op[i-1]='/'))or(i=1) then
                  begin
                  dir:=1;

                  end;
          inc(i);
          end
       else if op[i]='[' then
               begin
               for j:=i+1 to en do if op[j]=']' then break;
               inc(n); num[n]:=getnum(i+1,j-1);
               if dir=1 then
                  begin
                  sig[n]:=3;
                  dir:=0;
                  end;
               i:=j+1;
               end
            else if op[i]='+' then
                    begin
                    inc(m);opt[m]:=1;
                    ass[m]:=i;
                    inc(i);
                    end
                 else if op[i]='*' then
                         begin
                         inc(m);opt[m]:=3;
                         ass[m]:=i;
                         inc(i);
                         end
                      else if op[i]='/' then
                              begin
                              inc(m);opt[m]:=4;
                              ass[m]:=i;
                              inc(i);
                              end;
  end;
res[1]:=0; res[2]:=0;
if m=0 then
       begin
       ta:=f[1,1]; tb:=f[1,2];
       if sig[1]=0 then exit(calc(num[1],1,num[0]))
          else if sig[1]=3 then exit(calc(num[0],2,num[1]))
                  else if sig[1]=1 then exit(calc(solve(ta,tb),1,num[0]))
                          else exit(calc(num[0],2,solve(ta,tb)));
       end
   else begin
        mark:=false;
        last:=0;
        for i:=1 to m do
            begin
            if opt[i]<=2 then
               begin
               mark:=true;
               res:=calc(res,opt[last],solve(ass[last]+1,ass[i]-1));
               last:=i;
               end;
            end;
        if mark then res:=calc(res,opt[last],solve(ass[last]+1,en))
                else begin
                     last:=0;
                     for i:=1 to m do
                         begin
                         res:=calc(res,opt[last],solve(ass[last]+1,ass[i]-1));
                         last:=i;
                         end;
                     res:=calc(res,opt[last],solve(ass[last]+1,en));
                     end;
        exit(res);
        end;
end;
begin
assign(input,'intervala.in');
reset(input);
while not eof do
  begin
  readln(s);
  op:=''; top:=0;
  error:=false;
  for i:=1 to length(s) do
      begin
      if s[i]<>' 'then op:=op+s[i];
      end;
  fillchar(kh,sizeof(kh),0);
  fillchar(belong,sizeof(belong),0);
  for i:=1 to length(op) do
      begin
      if op[i]='(' then begin inc(top); kh[top]:=i; end
         else if op[i]=')' then begin belong[kh[top]]:=i; dec(top); end;
      end;
  ans:=solve(1,length(op));
  if error then writeln('Division by zero') else print;
  end;
close(input);
end.