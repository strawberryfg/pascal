var a,b,a1,b1:array[0..100]of longint;
    e:array[0..100]of boolean;
    l1,l2,i,j,k,m,n,length,flag:longint;
    s,s1,s2:string;
    q:char;

function check1(l1,l2:longint):boolean;
 var  h1,h2:array[0..9]of longint;
      i,j:longint;
  begin
   fillchar(h1,sizeof(h1),0);
   fillchar(h2,sizeof(h2),0);

   for i:=1 to l1 do
    h1[a[i]]:=1;
   for j:=1 to l2 do
    h2[b[j]]:=1;

   for i:=0 to 9 do if h1[i]<>h2[i] then exit(false);
   check1:=true;
  end;

function check(l1,l2:longint):longint;
var i,j,k:longint;
 begin

  if check1(l1,l2) then exit(1);
  if b[1]>1 then k:=1 else k:=2;
  for i:=k to l2 do
   begin

    if (b[i]<9)and(b[i-1]>0) then begin dec(b[i-1]);inc(b[i]);
    if check1(l1,l2) then exit(2)
     else begin inc(b[i-1]);dec(b[i]);end;
    end;

    if (b[i-1]<9)and(b[i]>0)then begin dec(b[i]);inc(b[i-1]);
    if check1(l1,l2) then exit(2)
     else begin inc(b[i]);dec(b[i-1]);end;
    end;

   end;
  check:=3;
  if k=2 then begin
   if (b[2]>0) then begin inc(b[1]);dec(b[2]); end;
   if check1(l1,l2) then exit(2);
   end;
 end;


begin
 assign(input,'friends.in');
 assign(output,'friends.out');
 reset(input);
 rewrite(output);

 readln(n);
for i:=1 to n do
 begin
  fillchar(a,sizeof(a),0);
  fillchar(a1,sizeof(a1),0);
  fillchar(b,sizeof(b),0);
  fillchar(b1,sizeof(b1),0);


  l1:=0;
  q:='.';
  while q<>' ' do
   begin
   read(q);
   if q<>' ' then begin
    inc(l1);
    a[l1]:=ord(q)-48;
    a1[a[l1]]:=1;
   end;
   end;
  l2:=0;
  while not eoln do
  begin
   read(q);
   inc(l2);
   b[l2]:=ord(q)-48;
   b1[b[l2]]:=1;
  end;
  readln;
  flag:=check(l1,l2);
  if flag=1 then writeln('friends')
  else if flag=2 then writeln('almost friends')
   else writeln('nothing');
 end;
 close(input);
 close(output);
end.


