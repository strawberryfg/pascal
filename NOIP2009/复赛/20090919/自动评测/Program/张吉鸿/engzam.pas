type link=^node;
	node=record c:longint;next:link;end;
var bo:array[0..1,0..1000003] of link;
    h:array[0..1,0..1000003] of boolean;
    n,m,p,i,j:longint;
    s:string;ch:char;
procedure Make(s:string;k:longint);
var i,j,c,d:longint;
    be:string;
    p:link;
begin
	c:=0;d:=0;be:='';
	for i:=1 to length(s) do
	  begin
	  c:=(c*26+ord(s[i])-97) mod 999983;
          h[0,c]:=true;
	  new(p);p^.c:=k;
          p^.next:=bo[0,c];
          bo[0,c]:=p;
          d:=(d*26+ord(s[i])-97) mod 1000003;
          h[1,d]:=true;
	  new(p);p^.c:=k;
          p^.next:=bo[1,d];
          bo[1,d]:=p;
	  end;
end;
function min(a,b:longint):longint;
begin if a<b then exit(a) else exit(b);end;
procedure Find(s:string;k:longint);
var p:link;
    c,i,tot,a,b:longint;
begin
	c:=0;a:=0;b:=0;
	for i:=1 to length(s) do c:=(c*26+ord(s[i])-97) mod 999983;
	p:=bo[0,c];
	while p<>nil do
	  begin
	  if p^.c>=k then inc(a);
	  p:=p^.next;
	  end;
        c:=0;
	for i:=1 to length(s) do c:=(c*26+ord(s[i])-97) mod 1000003;
        p:=bo[1,c];
        while p<>nil do
	  begin
	  if p^.c>=k then inc(b);
	  p:=p^.next;
	  end;
        c:=min(a,b);
        writeln(c);
end;
begin
assign(input,'engzam.in');reset(input);
assign(output,'engzam.out');rewrite(output);
        readln(n,m);
        fillchar(h,sizeof(h),false);
	for i:=1 to n do
	  begin
	  s:='';
	  repeat
	   read(ch);
	   if ch<>' ' then s:=s+ch;
	  until ch=' ';
	  readln(p);
	  Make(s,p);
	  end;
	for i:=1 to m do
	  begin
	  s:='';
	  repeat
	   read(ch);
	   if ch<>' ' then s:=s+ch;
	  until ch=' ';
	  readln(p);
	  Find(s,p);
	  end;
close(input);close(output);
end.
