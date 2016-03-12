Var i,j,m,n,p,dif:longint;
    flag:boolean;
    s,s1:string;
    a:array[1..2,0..9]of longint;

Function pd:boolean;
var i,j,m,dif:longint;
    a:array[1..2,0..9]of longint;
begin
  m:=1;dif:=0;
  fillchar(a,sizeof(a),0);
  for j:=1 to length(s) do
    begin
      if s[j]=' ' then begin inc(m);continue;end;
      inc(a[m,ord(s[j])-48]);
    end;
  for j:=0 to 9 do
    if ((a[1,j]=0)and(a[2,j]>0))or((a[1,j]>0)and(a[2,j]=0)) then inc(dif);
  if dif=0 then pd:=true else pd:=false;
end;

Begin
  assign(input,'friends.in');reset(input);
  assign(output,'friends.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      m:=1;dif:=0;
      fillchar(a,sizeof(a),0);
      readln(s);
      for j:=1 to length(s) do
        begin
          if s[j]=' ' then begin p:=j-1;inc(m);continue;end;
	  inc(a[m,ord(s[j])-48]);
	end;
      for j:=0 to 9 do
        if ((a[1,j]=0)and(a[2,j]>0))or((a[1,j]>0)and(a[2,j]=0)) then inc(dif);
      if dif=0 then begin writeln('friends');continue;end;
      s1:=s;flag:=false;
      for j:=1 to p-1 do
        begin
	  if (s[j]>'0')and(s[j+1]<'9') then
             if not((j=1)and(s[j]='1')) then
                begin
		  s[j]:=chr(ord(s[j])-1);
		  s[j+1]:=chr(ord(s[j+1])+1);
		end;
          if pd then begin flag:=true;break;end;
	  s:=s1;
	  if (s[j]<'9')and(s[j+1]>'0') then
             begin
	       s[j]:=chr(ord(s[j])+1);
	       s[j+1]:=chr(ord(s[j+1])-1);
	     end;
          if pd then begin flag:=true;break;end;
	  s:=s1;
	end;
      if flag then begin writeln('almost friends');continue;end;
      for j:=p+2 to length(s) do
        begin
	  if (s[j]>'0')and(s[j+1]<'9') then
             if not((j=p+2)and(s[j]='1')) then
                begin
		  s[j]:=chr(ord(s[j])-1);
		  s[j+1]:=chr(ord(s[j+1])+1);
		end;
          if pd then begin flag:=true;break;end;
	  s:=s1;
	  if (s[j]<'9')and(s[j+1]>'0') then
             begin
	       s[j]:=chr(ord(s[j])+1);
	       s[j+1]:=chr(ord(s[j+1])-1);
	     end;
          if pd then begin flag:=true;break;end;
	  s:=s1;
	end;
      if flag then begin writeln('almost friends');continue;end;
      writeln('nothing');
    end;
  close(output);
End.