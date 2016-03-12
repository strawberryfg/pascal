{
ID: xiaweiy1
PROG: fracdec
LANG: PASCAL
}
const maxnum=10000;   // modify to 1000;
      maxm=20000;
var s,ts:ansistring;    // modify to ansiansistring;
    t,poi,now,st,en,knum,i,tot,special,ss,tt,cnt:longint;
    yu:array[1..maxm]of ansistring;   //modify to ansiansistring;
    res:array[1..maxm]of longint;
    strr:ansistring;
    hash:array[0..20000]of longint;
function mul(a:char;b:ansistring):ansistring;     //modify to ansiansistring
var x,y,c:array[-1..maxnum*2]of longint;     //modify to 1000;
    i,max,k,j:longint;
    final:ansistring;                       //modify to ansiansistring;
begin
fillchar(x,sizeof(x),0); fillchar(y,sizeof(y),0);
fillchar(c,sizeof(c),0);
x[-1]:=0; x[0]:=ord(a)-48;
y[-1]:=-1;
for i:=length(b) downto 1 do
    begin
    inc(y[-1]);
    y[y[-1]]:=ord(b[i])-48;
    end;
max:=y[-1];
for i:=0 to 0 do
    for j:=0 to y[-1] do
         begin
         inc(c[i+j],x[i]*y[j]);
         k:=i+j;
         while c[k]>=10 do
           begin
           if k>max then max:=k;
           c[k+1]:=c[k+1]+c[k] div 10;
           c[k]:=c[k] mod 10;
           inc(k);
           end;
         end;
while c[k]>=10 do
      begin
      if k>max then max:=k;
      c[k+1]:=c[k+1]+c[k] div 10;
      c[k]:=c[k] mod 10;
      inc(k);
      end;
if c[k]<>0 then if k>max then max:=k;
final:='';
for i:=max downto 0 do final:=final+char(c[i]+48);
exit(final);
end;
function gjf(a,b:ansistring):ansistring;          //modify to ansiansistring;
var x,y,c:array[-1..maxnum*2]of longint;     //modify to 1000;
    i,t,max:longint;
    final:ansistring;                       //modify to ansiansistring;
begin
fillchar(x,sizeof(x),0); fillchar(y,sizeof(y),0);
fillchar(c,sizeof(c),0);
x[-1]:=-1; y[-1]:=-1;
for i:=length(a)downto 1 do begin inc(x[-1]);x[x[-1]]:=ord(a[i])-48; end;
for i:=length(b)downto 1 do begin inc(y[-1]);y[y[-1]]:=ord(b[i])-48; end;
max:=x[-1];
for i:=0 to max do
    begin
    t:=x[i]-y[i]+c[i];
    if t<0 then
       begin
       c[i+1]:=c[i+1]-1;
       t:=10+t;
       end;
    c[i]:=t;
    end;
if (max>0)and(c[max]=0) then dec(max);
//if c[max+1]<>0 then inc(max);
final:='';
for i:=max downto 0 do final:=final+char(c[i]+48);
exit(final);
end;
function handle(strr:ansistring):boolean;
var i:longint;
begin
if strr='' then exit(false);
for i:=1 to length(strr) do if strr[i]<>'0' then exit(false);
exit(true);
end;
function check(a:ansistring;p:longint):boolean;
var i,x:longint;
    code:integer;
begin
   if handle(a) then
      begin
      if p+1=special then
         begin
         inc(tot);
         res[tot]:=0;
         end;
      exit(true);
      end;
   if (st=0)and(en=0) then
       begin
       val(a,x,code);
       if (hash[x]=0) then hash[x]:=p
          else begin
               i:=hash[x];
               if (i+1>=special) then
                  begin
                  if i+1 <> special then st:=i+1 else st:=i+2;
                  en:=tot;
                  end;
               end;
       if tot-special=maxnum then exit(true) else exit(false);
       end;

end;
function cmp(x,y:ansistring):boolean;  //<=
begin
if (length(x)<length(y))or((length(x)=length(y))and(x<=y)) then exit(true)
    else exit(false);
end;
function cmpp(x,y:ansistring):boolean; // <
begin
if (length(x)<length(y))or((length(x)=length(y))and(x<y)) then exit(true)
    else exit(false);
end;

procedure work;
var i,j,len,num:longint;
    tmp,tobe,ans:ansistring;        //modify to ansiansistring;
    pd:boolean;
    code:integer;
begin
poi:=pos('.',s);
len:=0;                                 //initialization
if poi<>0 then len:=length(s)-poi       //79.864/587
          else s:=s+'.';
for i:=1 to maxnum-len do s:=s+'0';
poi:=pos('.',s);                       // new key;
tmp:=copy(s,1,poi-1);
tot:=0;
if cmpp(tmp,ts) then
   begin
   inc(tot); res[tot]:=0;
   yu[tot]:='';
   for i:=1 to length(ts) do
       yu[tot]:=yu[tot]+s[i];
   val(yu[tot],num,code);
   hash[num]:=tot;
   inc(tot); res[tot]:=-1;  // '.';
   special:=tot;   // . de weizhi
   tobe:=copy(s,1,poi-1);
   now:=poi+1;
   end
else
   begin
   now:=length(ts);                 // 79.864/587
   if now=1 then tobe:='' else tobe:=copy(s,1,now-1);
   end;
pd:=true;
while pd do
  begin
  tobe:=tobe+s[now];
  if (st<>0)and(en<>0) then exit;
  for i:=0 to 9 do
      begin
      if i=0 then
         begin
         ans:='';
         for j:=1 to length(tobe) do
             ans:=ans+'0';
         end
      else ans:=mul(char(i+48),ts);     //7678/797   797*3
      if cmp(ans,tobe) then
         begin
         ans:=gjf(tobe,ans);
         if cmpp(ans,ts) then       //yushu <=chushu
            begin
            inc(tot);res[tot]:=i;
            yu[tot]:=ans;
            num:=tot;
            if now+1=poi then
               begin
               inc(tot); res[tot]:=-1;    // '.'
               special:=tot;
               inc(now,2);
               num:=tot-1;
               end
            else
               inc(now);
            tobe:=ans;
            if check(ans,num) then exit;
            if handle(tobe) then tobe:='';   //yushuwei zero

            break;
            end;
         end;

      end;
  end;
end;
function getnum(k:longint):longint;
var x:ansistring;
begin
str(k,x); exit(length(x));
end;
begin
{writeln('input beichushu');
readln(s);
writeln('input chushu');
readln(ts);
writeln('baoliuweishu');
readln(knum); }
assign(input,'fracdec.in');
reset(input);
assign(output,'fracdec.out');
rewrite(output);
knum:=-1;
readln(strr);
tt:=pos(' ',strr);
s:=copy(strr,1,tt-1);
delete(strr,1,tt);
ts:=strr;
work;
cnt:=0;
if special>=3 then
   begin
   t:=0;
   while (t+1<=special-2)and(res[t+1]=0) do inc(t);
   for i:=1 to t do res[t]:=-2;
   end;
if (st<>0)and(en<>0) then
   begin
   for i:=1 to st-1 do
       begin
       if res[i]=-2 then continue;
       if res[i]=-1 then
          begin
          inc(cnt);
          write('.')
          end
       else
          begin
          inc(cnt,getnum(res[i]));
          write(res[i]);
          end;
       if cnt mod 76=0 then writeln;
       end;
   write('(');
   inc(cnt); if cnt mod 76=0 then writeln;
   for i:=st to en do
       begin
       write(res[i]);
       inc(cnt); if cnt mod 76=0 then writeln;
       end;
   write(')');
   inc(cnt);
   writeln;
   end
else
   begin
   for i:=1 to tot do
       begin
       if res[i]=-2 then continue;
       if res[i]=-1 then
          begin
          inc(cnt);
          write('.')
          end
       else
          begin
          inc(cnt,getnum(res[i]));
          write(res[i]);
          end;
       if cnt mod 76=0 then writeln;
       end;
   if cnt mod 76<>0 then writeln;
   end;
{writeln('input anything to exit');
readln(ss);}
close(input);
close(output);
end.

