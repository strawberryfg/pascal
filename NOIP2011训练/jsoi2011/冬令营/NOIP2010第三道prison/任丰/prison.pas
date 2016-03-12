type rectype=record
             x,y,c:longint;
             end;
     plink=^point;
     point=record
           x:longint;
           next:plink;
           end;
var
    t:array [1..50000] of plink;
    c:array [1..50000] of longint;
    e:array [0..200000] of rectype;
    n,m:longint;
    h:boolean;

procedure sort(l,r:longint);
var i,j,v:longint;
    temp:rectype;
 begin
 i:=l;
 j:=r;
 v:=e[(l+r) div 2].c;
 repeat
 while e[i].c<v do
       inc(i);
 while e[j].c>v do
       dec(j);
 if i<=j then begin
              temp:=e[i];
              e[i]:=e[j];
              e[j]:=temp;
              inc(i);
              dec(j);
              end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

procedure re;
var i:longint;
 begin
 readln(n,m);
 for i:=1 to m do
     readln(e[i].x,e[i].y,e[i].c);
 e[0].c:=0;
 sort(0,m);
 for i:=0 to m do
     begin
	 writeln(e[i].x,'   ',e[i].y,'   ',e[i].c );
	 end;
 end;

procedure pro(d,r:longint);
var u:plink;
 begin
 if h=false then exit;
 if c[d]=r then exit;
 if c[d]=-r then begin
                 h:=false;
                 exit;
                 end;
 c[d]:=r;
 u:=t[d];
 while u<>nil do
       begin
       pro(u^.x,-r);
       u:=u^.next;
       end;
 end;

function check(min:longint):boolean;
var i:longint;
    u:plink;
 begin
 for i:=1 to n do
     t[i]:=nil;
 for i:=min to m do
     begin
     new(u);
     u^.x:=e[i].y;
     u^.next:=t[e[i].x];
     t[e[i].x]:=u;
     new(u);
     u^.x:=e[i].x;
     u^.next:=t[e[i].y];
     t[e[i].y]:=u;
     end;

 h:=true;
 fillchar(c,sizeof(c),0);
 for i:=1 to n do
     begin
     if c[i]=0 then pro(i,1);
     if h=false then break;
     end;
 check:=h;
 end;

procedure work;
var p,q,ans:longint;
 begin
 p:=1;
 q:=m;
 while p<=q do
       begin
       if check((p+q) div 2) then begin
                                  ans:=(p+q) div 2;
                                  q:=(p+q) div 2-1;
                                  end
                             else p:=(p+q) div 2+1;
       end;
 writeln(e[ans-1].c);
 end;

begin
assign(input,'prison.in');
reset(input);
{assign(output,'prison.out');
rewrite(output);}
re;
work;
close(input);
close(output);
end.
