var str,tmp,s:string;
    i,j,len,now,n:longint;
    t:char;

begin
readln(str);
len:=length(str);
now:=len;
readln(n);
for i:=1 to n do
    begin
    readln(s);
    if s[1]='L' then
       begin
       if now-1>=0 then dec(now);
       end
    else if s[1]='D' then
            begin
            if now+1<=len then inc(now);
            end
        else if s[1]='B' then
                begin
                if now<>0 then
                begin
                tmp:='';
                for j:=1 to now-1 do tmp:=tmp+str[j];
                for j:=now to len-1 do tmp:=tmp+str[j+1];
                dec(len);
                dec(now);
                str:=tmp;
                end;
                end
             else
             begin
             t:=s[3];
             tmp:='';
             for j:=1 to now do tmp:=tmp+str[j];
             tmp:=tmp+t;
             for j:=now+1 to len do
                 begin
                 tmp:=tmp+str[j];
                 end;
             str:=tmp;
             inc(len);
             now:=now+1;
             end;
    end;
writeln(str);
end.
