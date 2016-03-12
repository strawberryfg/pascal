var n,t,l,l1,l2,pd,i:longint;
    h1,h2:array['0'..'9']of longint;
    ch,c1,c2:char;
    s1,s2:string;

procedure ppp1(k:longint);
var c3,c4:char;
begin
  if (c1<>'0')and(c2<>'9') then
    begin
      if (k=1)and(c1='1') then begin end else begin
      c3:=char(ord(c1)-1);
      c4:=char(ord(c2)+1);
      inc(h2[c3]);
      inc(h2[c4]);
      dec(h2[c1]);
      dec(h2[c2]);
      pd:=2;
      for ch:='0' to '9' do
        if (h2[ch]=0)and(h1[ch]<>0) then pd:=1
          else if (h1[ch]=0)and(h2[ch]<>0) then pd:=1;
      inc(h2[c1]);
      inc(h2[c2]);
      dec(h2[c3]);
      dec(h2[c4]);                           end;
    end;
  if (c1<>'9')and(c2<>'0')and(pd<>2) then
    begin
      c3:=char(ord(c1)+1);
      c4:=char(ord(c2)-1);
      inc(h2[c3]);
      inc(h2[c4]);
      dec(h2[c1]);
      dec(h2[c2]);
      pd:=2;
      for ch:='0' to '9' do
        if (h2[ch]=0)and(h1[ch]<>0) then pd:=1
          else if (h1[ch]=0)and(h2[ch]<>0) then pd:=1;
      inc(h2[c1]);
      inc(h2[c2]);
      dec(h2[c3]);
      dec(h2[c4]);
    end;
end;

procedure ppp(k:longint);
var c3,c4:char;
begin
  if (c1<>'0')and(c2<>'9') then
    begin
      if (k=1)and(c1='1') then begin end else begin
      c3:=char(ord(c1)-1);
      c4:=char(ord(c2)+1);
      inc(h1[c3]);
      inc(h1[c4]);
      dec(h1[c1]);
      dec(h1[c2]);
      pd:=2;
      for ch:='0' to '9' do
        if (h2[ch]=0)and(h1[ch]<>0) then pd:=1
          else if (h1[ch]=0)and(h2[ch]<>0) then pd:=1;
      inc(h1[c1]);
      inc(h1[c2]);
      dec(h1[c3]);
      dec(h1[c4]);                            end;
    end;
  if (c1<>'9')and(c2<>'0')and(pd<>2) then
    begin
      c3:=char(ord(c1)+1);
      c4:=char(ord(c2)-1);
      inc(h1[c3]);
      inc(h1[c4]);
      dec(h1[c1]);
      dec(h1[c2]);
      pd:=2;
      for ch:='0' to '9' do
        if (h2[ch]=0)and(h1[ch]<>0) then pd:=1
          else if (h1[ch]=0)and(h2[ch]<>0) then pd:=1;
      inc(h1[c1]);
      inc(h1[c2]);
      dec(h1[c3]);
      dec(h1[c4]);
    end;
end;

begin
assign(input,'friends.in');
assign(output,'friends.out');
reset(input);
rewrite(output);
  readln(n);
  for t:=1 to n do
    begin
      readln(s1);
      l:=length(s1);
      fillchar(h1,sizeof(h1),0);
      fillchar(h2,sizeof(h2),0);
      for i:=1 to l do
        if s1[i]=' ' then break
                     else inc(h1[s1[i]]);
      s2:=copy(s1,i+1,l-i);
      delete(s1,i,l-i+1);
      l1:=length(s1);
      l2:=length(s2);
      for i:=1 to l2 do inc(h2[s2[i]]);
      pd:=0;
      for ch:='0' to '9' do
        if (h2[ch]=0)and(h1[ch]<>0) then pd:=1
          else if (h1[ch]=0)and(h2[ch]<>0) then pd:=1;
      if pd=0 then writeln('friends')
        else begin
               for i:=1 to l1-1 do
                 begin
                   if pd=2 then break;
                   c1:=s1[i];
                   c2:=s1[i+1];
                   ppp(i);
                 end;
               for i:=1 to l2-1 do
                 begin
                   if pd=2 then break;
                   c1:=s2[i];
                   c2:=s2[i+1];
                   ppp1(i);
                 end;
               if pd=2 then writeln('almost friends')
                       else writeln('nothing');
             end;
    end;
close(input);
close(output);
end.
