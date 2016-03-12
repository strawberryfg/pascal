var n,i,j,k,l,q,t,h:longint;
    a,b:array[1..101]of char;
    d,f:array[1..101]of longint;
    h1,h2:array[0..10]of word;
procedure pd;
var i:longint;
begin
t:=0;
for i:=0 to 9 do
    if (h1[i]<>h2[i])and((h1[i]=0)or(h2[i]=0)) then inc(t);
end;
begin
assign(input,'friends.in');
assign(output,'freinds.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    q:=0;
    j:=0;
    while not eoln do
          begin
          inc(j);
          if q=0 then begin read(a[j]);if a[j]<>' 'then h1[ord(a[j])-48]:=1;end
                 else begin read(b[j]);h2[ord(b[j])-48]:=1;end;
          if a[j]=' ' then begin q:=1;l:=j-1;end;
          end;
    for j:=1 to l do
        d[j]:=ord(a[j])-48;
    for j:=l+2 to k-1 do
        f[j-l+3]:=ord(a[j])-48;
    pd;
    if t=0 then begin writeln('friends');break;end
            else if t>4 then begin writeln('nothing');break;end;
    for j:=1 to l do
        begin
        if t=0 then break;
        for h:=1 to 2 do
            begin
            case h of 1:if not((j=1)and(d[j]=1)) then begin d[j]:=d[j]-1;d[j+1]:=d[j+1]+1;inc(h1[d[j]]);inc(h1[d[j+1]]);end;
                      2:begin d[j]:=d[j]+1;d[j+1]:=d[j+1]-1;inc(h1[d[j]]);inc(h1[d[j+1]]);end;
                      end;
            pd;
            dec(h1[d[j]]);dec(h1[d[j+1]]);
            if t=0 then begin writeln('almost friends');break;end;
            end;
        end;
    for j:=1 to k-l-3 do
        begin
        if t=0 then break;
        for h:=1 to 2 do
            begin
            case h of 1:if not((j=1)and(d[j]=1)) then begin f[j]:=f[j]-1;f[j+1]:=f[j+1]+1;inc(h1[d[j]]);inc(h1[d[j+1]]);end;
                      2:begin d[j]:=d[j]+1;d[j+1]:=d[j+1]-1;inc(h1[d[j]]);inc(h1[d[j+1]]);end;
                      end;
            pd;
            dec(h1[d[j]]);dec(h1[d[j+1]]);
            if t=0 then begin writeln('almost friends');break;end;
            end;
        end;
    if t=0 then break
           else begin writeln('nothing');break;end;
    end;
close(input);
close(output);
end.
