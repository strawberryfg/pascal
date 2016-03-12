var	z:longint;
	s1,s2:string;
	ch:char;
function judge(s1,s2:string):boolean;
var	h:array['0'..'9']of longint;
	ch:char; i,n,m:longint;
	ans:boolean;
begin
fillchar(h,sizeof(h),0);
n:=length(s1); m:=length(s2);
for i:=1 to n do if h[s1[i]]=0 then inc(h[s1[i]]);
for i:=1 to m do if h[s2[i]]=1 then dec(h[s2[i]]);
ans:=true;
for ch:='0' to '9' do ans:=ans and(h[ch]=0);
judge:=ans;
end;
function check(s1,s2:string):boolean;
var	i,n,m:longint;
	s0:string;
	ans:boolean;
begin
ans:=false;
n:=length(s1); m:=length(s2);
for i:=1 to m-1 do
	begin
	s0:=s2;
	if (s0[i]<>'0')and(s0[i+1]<>'9')
		then begin
		s0[i]:=char(ord(s0[i])-1);
		s0[i+1]:=char(ord(s0[i+1])+1);
                if s0[1]='0' then continue;
		ans:=ans or(judge(s0,s1));
		end;
        s0:=s2;
	if (s0[i]<>'9')and(s0[i+1]<>'0')
		then begin
		s0[i]:=char(ord(s0[i])+1);
		s0[i+1]:=char(ord(s0[i+1])-1);
                if s0[1]='0' then continue;
		ans:=ans or(judge(s0,s1));
		end;
	end;
check:=ans;
end;
begin
assign(input,'friends.in'); reset(input);
assign(output,'friends.out'); rewrite(output);
readln(z);
while z>0 do
	begin
	dec(z);
	s1:=''; s2:='';
	read(ch);
	while ch<>' ' do
		begin
		s1:=s1+ch;
		read(ch);
		end;
	while not eoln do
		begin
		read(ch);
		s2:=s2+ch;
		end;
	if judge(s1,s2)
		then writeln('friends')
		else if (check(s1,s2))or(check(s2,s1))
			then writeln('almost friends')
			else writeln('nothing');
        readln;
        end;
close(input); close(output);
end.
