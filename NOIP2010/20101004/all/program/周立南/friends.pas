type atype=array [0..150] of longint;
var a,s1,s2:atype;
    hasha,hashb,hash1,hash2:array [-5..15] of boolean;
    n,i,ii,l1,l2,code:longint;
    ch:char;
    f,ok,find:boolean;

function check(b:atype;l:longint):boolean;
var i,j,x:longint;
    s:atype;
begin
  s:=b;
  check:=false;
  for i:=2 to l do
    begin
      if (hasha[s[i-1]+1] and hasha[s[i]-1]) then begin
                                                    inc(s[i-1]);
                                                    dec(s[i]);
                                                    fillchar(hashb,sizeof(hashb),0);
                                                    for j:=1 to l do
                                                      hashb[s[j]]:=true;
                                                    x:=1;
                                                    while s[x]=0 do inc(x);
                                                    if (x=1) then begin
                                                                    find:=true;
                                                                    for j:=0 to 9 do
                                                                      if hasha[j]<>hashb[j] then find:=false;
                                                                    if find then begin
                                                                                   check:=true;
                                                                                   break;
                                                                                 end;
                                                                  end;
                                                    dec(s[i-1]);
                                                    inc(s[i]);
                                                  end;
      if (hasha[s[i-1]-1] and hasha[s[i]+1]) then begin
                                                    dec(s[i-1]);
                                                    inc(s[i]);
                                                    fillchar(hashb,sizeof(hashb),0);
                                                    for j:=1 to l do
                                                      hashb[s[j]]:=true;
                                                    x:=1;
                                                    while s[x]=0 do inc(x);
                                                    if (x=1) then begin
                                                                    find:=true;
                                                                    for j:=0 to 9 do
                                                                      if hasha[j]<>hashb[j] then find:=false;
                                                                    if find then begin
                                                                                   check:=true;
                                                                                   break;
                                                                                 end;
                                                                  end;
                                                    inc(s[i-1]);
                                                    dec(s[i]);
                                                  end;
    end;
end;

begin
  assign(input,'friends.in');
  assign(output,'friends.out');
  reset(input);
  rewrite(output);
  readln(n);
  for ii:=1 to n do
    begin
      l1:=0;
      read(ch);
      fillchar(hash1,sizeof(hash1),0);
      while ch<>' ' do
        begin
          inc(l1);
          val(ch,s1[l1],code);
          hash1[s1[l1]]:=true;
          read(ch);
        end;
      l2:=0;
      fillchar(hash2,sizeof(hash2),0);
      while not(eoln) do
        begin
          read(ch);
          inc(l2);
          val(ch,s2[l2],code);
          hash2[s2[l2]]:=true;
        end;
      readln;
      f:=true;
      for i:=0 to 9 do
        if (hash1[i]<>hash2[i]) then begin
                                       f:=false;
                                       break;
                                     end;
      if f then begin
                  writeln('friends');
                  continue;
                end;
      hasha:=hash1;
      hashb:=hash2;
      a:=s1;
      ok:=check(s2,l2);
      hasha:=hash2;
      hashb:=hash1;
      a:=s2;
      ok:=(ok) or (check(s1,l1));
      if (ok) then writeln('almost friends')
              else writeln('nothing');
    end;
  close(input);
  close(output);
end.
