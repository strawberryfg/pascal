var n,i,j,t:longint;
    s:string;
    f1,f2:array['0'..'9'] of longint;
function pd:boolean;
var i:char;
begin
for i:='0' to '9' do
        if ((f1[i]<>0)or(f2[i]<>0))and(f1[i]*f2[i]=0) then exit(false);
pd:=true;
end;
function pdd:boolean;
var i,j,t,tt:longint;
begin
t:=0;tt:=0;
for i:=1 to length(s)-1 do
        if (s[i]<>' ')and(s[i+1]<>' ') then
                        begin
                                if t=0 then
                                                begin
                                                        dec(f1[s[i]]);dec(f1[s[i+1]]);
                                                        if (s[i]<'9')and(s[i+1]>'0') then begin
                                                        inc(f1[char(ord(s[i])+1)]);
                                                        inc(f1[char(ord(s[i+1])-1)]);
                                                        if pd then exit(true);
                                                        dec(f1[char(ord(s[i])+1)]);
                                                        dec(f1[char(ord(s[i+1])-1)]);end;
                                                        if ((i=1)and(s[i]>'1')and(s[i+1]<'9'))or((i<>1)and(s[i]>'0')and(s[i+1]<'9')) then begin
                                                        inc(f1[char(ord(s[i])-1)]);
                                                        inc(f1[char(ord(s[i+1])+1)]);
                                                        if pd then exit(true);
                                                        dec(f1[char(ord(s[i])-1)]);
                                                        dec(f1[char(ord(s[i+1])+1)]);end;

                                                        inc(f1[s[i]]);inc(f1[s[i+1]]);
                                                end
                                                else
                                                begin
                                                        dec(f2[s[i]]);dec(f2[s[i+1]]);
                                                        if (s[i]<'9')and(s[i+1]>'0') then begin
                                                        inc(f2[char(ord(s[i])+1)]);
                                                        inc(f2[char(ord(s[i+1])-1)]);
                                                        if pd then exit(true);
                                                        dec(f2[char(ord(s[i])+1)]);
                                                        dec(f2[char(ord(s[i+1])-1)]);end;
                                                        if ((tt=1)and(s[i]>'1')and(s[i+1]<'9'))or((tt<>1)and(s[i]>'0')and(s[i+1]<'9')) then begin
                                                        inc(f2[char(ord(s[i])-1)]);
                                                        inc(f2[char(ord(s[i+1])+1)]);
                                                        if pd then exit(true);
                                                        dec(f2[char(ord(s[i])-1)]);
                                                        dec(f2[char(ord(s[i+1])+1)]);end;

                                                        inc(f2[s[i]]);inc(f2[s[i+1]]);
                                                end;
                        end
                        else begin t:=1;tt:=1;end;

end;
begin
assign(input,'friends.in');reset(input);
assign(output,'friends.out');rewrite(output);
readln(n);
for i:=1 to n do
        begin
                fillchar(f1,sizeof(f1),0);
                fillchar(f2,sizeof(f2),0);
                readln(s);
                t:=0;
                for j:=1 to length(s) do
                        begin
                                if s[j]<>' ' then
                                begin
                                if t=0 then inc(f1[s[j]])
                                        else inc(f2[s[j]]);
                                end
                                else inc(t);
                        end;
                if pd then writeln('friends')
                        else
                                begin
                                        if pdd then writeln('almost friend')
                                                else writeln('nothing');
                                end;

        end;
close(input);
close(output);
end.