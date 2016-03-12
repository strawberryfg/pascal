type atype=array[1..100000]of longint;
     btype=array[1..100000]of string;
     trie=record
        pd:boolean;
        next:array[1..26]of longint;
        end;

var n,m,ls2,ls3,e,i,j,pt,t:longint;
ls:string;
flag:boolean;
a,b:btype;
p,l,ans,l2:atype;
c:array[0..1000000]of trie;

procedure sort(var a:atype;var b:btype;l,r:longint;flag:boolean);
var i,j,x,y: longint;
y2:string;
begin
i:=l;j:=r;x:=a[(l+r) div 2];
repeat
 while a[i]>x do inc(i);
 while x>a[j] do dec(j);
 if not(i>j) then begin
        y:=a[i];a[i]:=a[j];a[j]:=y;
        y2:=b[i];b[i]:=b[j];b[j]:=y2;
        if flag then begin
           y:=l2[i];l2[i]:=l2[j];l2[j]:=y;
           end;
        inc(i);j:=j-1;
        end;
until i>j;
if l<j then sort(a,b,l,j,flag);
if i<r then sort(a,b,i,r,flag);
end;


function plusit(ls2:longint):longint;
var i,ls:longint;
begin
  ls:=0;
  if c[ls2].pd then inc(ls);
  for i:=1 to 26 do
        if c[ls2].next[i]<>0 then
                inc(ls,plusit(c[ls2].next[i]));
  exit(ls);
end;


begin
assign(input,'engzam.in');reset(input);
assign(output,'engzam.out');rewrite(output);
readln(n,m);
for i:=1 to n do begin
	readln(ls);
	ls2:=length(ls);
	while ls[ls2]<>' ' do dec(ls2);
	val(copy(ls,ls2+1,length(ls)-ls2),p[i],e);
	a[i]:=copy(ls,1,ls2-1);
	end;
sort(p,a,1,n,false);
for i:=1 to m do begin
        readln(ls);
	ls2:=length(ls);
	while ls[ls2]<>' ' do dec(ls2);
	val(copy(ls,ls2+1,length(ls)-ls2),l[i],e);
	b[i]:=copy(ls,1,ls2-1);
        l2[i]:=i;
        end;
sort(l,b,1,m,true);pt:=0;ls2:=1;

for i:=1 to m do begin
        t:=1;
        while p[t]>=l[i] do begin
           ls:=a[t];
           ls2:=0;
           for j:=1 to length(ls) do
             if c[ls2].next[ord(ls[j])-96]<>0 then ls2:=c[ls2].next[ord(ls[j])-96]
                else begin
                   inc(pt);
                   c[ls2].next[ord(ls[j])-96]:=pt;
                   ls2:=pt;
                   end;
           c[ls2].pd:=true;
           inc(t);
           end;

        ls:=b[i];flag:=false;ls2:=0;
        for j:=1 to length(ls) do
                if c[ls2].next[ord(ls[j])-96]<>0 then ls2:=c[ls2].next[ord(ls[j])-96]
                else begin
                     flag:=true;
                     break;
                    end;
        if not flag then ls3:=plusit(ls2) else ls3:=0;
        ans[l2[i]]:=ls3;
	end;
for i:=1 to m do writeln(ans[i]);
close(input);close(output);
end.
