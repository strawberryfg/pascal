type tree=^node;
     node=record
     child:array[1..26]of tree;
     word:char;
     data,childrennum:longint;
     pd:boolean;
end;
var m,n,i,l,j,q,kk,times,t:longint;
    dir,head,k,f:tree;
    s,ss:string;
    boo:boolean;
procedure try(dir:tree);
var k,i:longint;
    f:tree;
begin
if dir^.pd=true then if dir^.data>=l then inc(t);
k:=dir^.childrennum;
f:=dir;
for i:=1 to k do
    begin
    dir:=dir^.child[i];
    try(dir);
    dir:=f;
    end;
end;
begin
assign(input,'engzam.in');
reset(input);
assign(output,'engzan.out');
rewrite(output);
readln(n,m);
new(dir);
head:=dir;
for i:=1 to n do
    begin
    readln(s);
    ss:='';
    for j:=1 to length(s) do
        if s[j]<>' 'then ss:=ss+s[j]
                    else begin
                         kk:=j;
                         break;
                         end;
    times:=0;
    for j:=kk+1 to length(s) do
        times:=times*10+ord(s[j])-ord('0');
    dir:=head;
    s:=ss;
    for j:=1 to length(s) do
        begin
        boo:=true;
        k:=dir;
        kk:=dir^.childrennum;
        for q:=1 to kk do
            begin
            dir:=dir^.child[q];
            if s[j]=dir^.word then begin
                                   boo:=false;
                                   break;
                                   end
                              else dir:=k;
            end;
        if boo=true then begin
                         new(dir);
                         f:=dir;
                         dir:=k;
                         inc(dir^.childrennum);
                         dir^.child[dir^.childrennum]:=f;
                         dir:=f;
                         dir^.word:=s[j];
                         dir^.pd:=false;
                         dir^.childrennum:=0;
                         end;
        end;
    dir^.pd:=true;
    dir^.data:=times;
    end;
for i:=1 to m do
    begin
    readln(s);
    ss:='';
    for j:=1 to length(s) do
        if s[j]<>' ' then ss:=ss+s[j]
                     else begin
                          kk:=j;
                          break;
                          end;
    l:=0;
    for j:=kk+1 to length(s) do
        l:=l*10+ord(s[j])-ord('0');
    dir:=head;
    s:=ss;
    dir:=head;
    for j:=1 to length(s) do
        begin
        k:=dir;
        kk:=dir^.childrennum;
        boo:=false;
        for q:=1 to kk do
            begin
            dir:=dir^.child[q];
            if dir^.word=s[j] then begin
                                   boo:=true;
                                   break;
                                   end
                              else dir:=k;
            end;
        if boo=false then begin
                          writeln(0);
                          break;
                          end;
        if j=length(s) then begin
                            t:=0;
                            try(dir);
                            writeln(t);
                            end;
        end;
    end;
close(output);
close(input);
end.