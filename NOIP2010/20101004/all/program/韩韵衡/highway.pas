const	max=500000;
	oo=-maxlongint;
var	l,r,ls,rs,s,cm,dm:array[1..max]of longint;
	c,n,m,s0,tt,x,y,z,i,ans:longint;
        can:boolean;
procedure build(a,b:longint);
var	x,mid:longint;
begin
inc(tt); x:=tt;
l[x]:=a; r[x]:=b; s[x]:=s0;
cm[x]:=0; dm[x]:=0;
if b-a>1
	then begin
	mid:=(a+b)shr 1;
	ls[x]:=tt+1; build(a,mid);
	rs[x]:=tt+1; build(mid,b);
	end;
end;
procedure down(x:longint);
begin
if cm[x]>0
	then begin
	if (ls[x]<>0)and(cm[ls[x]]<cm[x])
		then cm[ls[x]]:=cm[x];
	if (rs[x]<>0)and(cm[ls[x]]<cm[x])
		then cm[rs[x]]:=cm[x];
	if (s[x]<>oo)and(dm[x]+s[x]<cm[x])
		then begin
		s[x]:=cm[x];
		dm[x]:=0;
		end;
	cm[x]:=0;
	end
	else if dm[x]<>0
		then begin
		if ls[x]<>0 then if cm[ls[x]]<>0
			then cm[ls[x]]:=cm[ls[x]]+dm[x]
			else dm[ls[x]]:=dm[ls[x]]+dm[x];
		if rs[x]<>0 then if cm[rs[x]]<>0
			then cm[rs[x]]:=cm[rs[x]]+dm[x]
			else dm[rs[x]]:=dm[rs[x]]+dm[x];
		if s[x]>0 then s[x]:=s[x]+dm[x];
		dm[x]:=0;
		end;
end;
procedure check(x,a,b,c:longint);
begin
down(x);
if (a>=r[x])or(b<=l[x]) then exit;
if s[x]<>oo
	then can:=can and(s[x]>0)
	else begin
	if ls[x]<>0 then check(ls[x],a,b,c);
	if rs[x]<>0 then check(rs[x],a,b,c);
	end;
end;
procedure insert(x,a,b,c:longint);
var	mid:longint;
begin
down(x);
if (a<=l[x])and(r[x]<=b)
	then begin
	if cm[x]<>0
		then cm[x]:=cm[x]+c
		else dm[x]:=dm[x]+c;
	end
	else begin
        s[x]:=oo;
	mid:=(l[x]+r[x])shr 1;
	if a<mid then insert(ls[x],a,b,c);
	if b>mid then insert(rs[x],a,b,c);
	end;
end;
procedure cover(x,a,b,c:longint);
var	mid:longint;
begin
down(x);
if (a<=l[x])and(r[x]<=b)
	then begin
	if cm[x]<c then cm[x]:=c;
	end
	else begin
	s[x]:=oo;
	mid:=(l[x]+r[x])shr 1;
	if a<mid then cover(ls[x],a,b,c);
	if b>mid then cover(rs[x],a,b,c);
	end;
end;
begin
assign(input,'highway.in'); reset(input);
assign(output,'highway.out'); rewrite(output);
readln(n,m,s0);
tt:=0;
build(0,n*2-1);
ans:=0;
for i:=1 to m do
	begin
	readln(c,x,y,z);
	x:=x*2-2; y:=y*2-1;
	case c of
		1:
			begin
			can:=true;
			check(1,x,y,z);
			if can
				then begin
				inc(ans);
				insert(1,x,y,-z);
				end;
			end;
		2:	insert(1,x,y,z);
		3:	cover(1,x,y,z);
		end;
	end;
writeln(ans);
close(input); close(output);
end.
