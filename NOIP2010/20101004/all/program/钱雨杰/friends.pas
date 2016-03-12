type htype=array['/'..':'] of boolean;
var s,s1,s2:string;
    a1,a2:array['/'..':'] of longint;
    h1,h2,h:htype;
    n,i,j,k,t:longint;

  function p(h1,h2:htype):boolean;
    var i:char;
    begin
    for i:='0' to '9' do
        if h1[i]<>h2[i] then exit(false);
    exit(true);
    end;

  function pd:boolean;
    var i,j:longint; ch1,ch2:char;
    begin
    for i:=1 to length(s1)-1 do  {-1,+1}
        begin
        h:=h1;
        if s1[i]='0' then continue;
        if (i=1)and(s1[1]='1') then continue;
        if s1[i+1]='9' then continue;
        if a1[s1[i]]=1 then h[s1[i]]:=false;
        if a1[s1[i+1]]=1 then h[s1[i+1]]:=false;
        ch1:=chr(ord(s1[i])-1);
        ch2:=chr(ord(s1[i+1])+1);
        if h[ch1]=false then h[ch1]:=true;
        if h[ch2]=false then h[ch2]:=true;
        if p(h,h2) then exit(true);
        end;
    for i:=1 to length(s1)-1 do  {+1,-1}
        begin
        h:=h1;
        if s1[i]='9' then continue;
        if s1[i+1]='0' then continue;
        if (i=length(s1)+1)and(s1[i+1]='0') then continue;
        if a1[s1[i]]=1 then h[s1[i]]:=false;
        if a1[s1[i+1]]=1 then h[s1[i+1]]:=false;
        ch1:=chr(ord(s1[i])+1);
        ch2:=chr(ord(s1[i+1])-1);
        if h[ch1]=false then h[ch1]:=true;
        if h[ch2]=false then h[ch2]:=true;
        if p(h,h2) then exit(true);
        end;
    for i:=1 to length(s2)-1 do  {-1,+1}
        begin
        h:=h2;
        if s2[i]='0' then continue;
        if (i=1)and(s2[1]='1') then continue;
        if s2[i+1]='9' then continue;
        if a2[s2[i]]=1 then h[s2[i]]:=false;
        if a2[s2[i+1]]=1 then h[s2[i+1]]:=false;
        ch1:=chr(ord(s2[i])-1);
        ch2:=chr(ord(s2[i+1])+1);
        if h[ch1]=false then h[ch1]:=true;
        if h[ch2]=false then h[ch2]:=true;
        if p(h,h1) then exit(true);
        end;
    for i:=1 to length(s2)-1 do  {+1,-1}
        begin
        h:=h2;
        if s2[1]='9' then continue;
        if s2[i+1]='0' then continue;
        if a2[s2[i]]=1 then h[s2[i]]:=false;
        if a2[s2[i+1]]=1 then h[s2[i+1]]:=false;
        ch1:=chr(ord(s2[i])+1);
        ch2:=chr(ord(s2[i+1])-1);
        if h[ch1]=false then h[ch1]:=true;
        if h[ch2]=false then h[ch2]:=true;
        if p(h,h1) then exit(true);
        end;
    exit(false);
    end;

begin
assign(input,'friends.in');
reset(input);
assign(output,'friends.out');
rewrite(output);
    readln(n);
    for t:=1 to n do
        begin
        readln(s);
        s1:=''; s2:='';
        fillchar(a1,sizeof(a1),0);
        fillchar(a2,sizeof(a2),0);
        fillchar(h1,sizeof(h1),false);
        fillchar(h2,sizeof(h2),false);
        for j:=1 to length(s) do
            if s[j]=' ' then break
                        else begin s1:=s1+s[j]; inc(a1[s[j]]); h1[s[j]]:=true; end;
        for k:=j+1 to length(s) do
            begin s2:=s2+s[k]; inc(a2[s[k]]); h2[s[k]]:=true; end;
        if p(h1,h2) then writeln('friends')
                    else if pd=true then writeln('almost friends')
                                    else writeln('nothing');
        end;
close(input);
close(output);
end.
