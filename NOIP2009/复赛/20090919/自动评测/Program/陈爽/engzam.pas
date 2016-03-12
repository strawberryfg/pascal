var s:array [0..100005] of string;
    num:array [0..100005] of longint;
    ch:char;
    left,right,i,ans,k,x,n,m:longint;
    str:string;

procedure qsort(l,r:longint);
var i,j,temp:longint;
    tmp,mid:string;
begin
   i:=l; j:=r; mid:=s[random(r-l+1)+l];
   repeat while s[i]<mid do inc(i);
          while s[j]>mid do dec(j);
          if not (i>j) then
          begin
             temp:=num[i]; num[i]:=num[j]; num[j]:=temp;
             tmp:=s[i]; s[i]:=s[j]; s[j]:=tmp;
             inc(i); dec(j);
          end;
   until i>j;
   if i<r then qsort(i,r);
   if l<j then qsort(l,j);
end;

procedure searchleft(kk:longint; c:string);
var l,r,mid:longint;
    tmp:string;
begin
   l:=left; r:=right;
   while (r-l>1) do
   begin
      mid:=(l+r) div 2;
      tmp:=copy(s[mid],1,kk);
      if tmp<c
        then l:=mid
        else r:=mid;
   end;
   if copy(s[l],1,kk)=c
     then left:=l
     else if copy(s[r],1,kk)=c
             then left:=r
             else left:=n+1;
end;

procedure searchright(kk:longint; c:string);
var l,r,mid:longint;
    tmp:string;
begin
   l:=left; r:=right;
   while (r-l>1) do
   begin
      mid:=(l+r) div 2;
      tmp:=copy(s[mid],1,kk);
      if tmp<=c
        then l:=mid
        else r:=mid;
   end;
   if copy(s[l],1,kk)>c
     then right:=l
     else if copy(s[r],1,kk)>c
             then right:=r;
end;

begin
   assign(input,'engzam.in');
   assign(output,'engzam.out');
   reset(input);
   rewrite(output);
   readln(n,m);
   for i:=1 to n do
   begin
      s[i]:='';
      read(ch);
      while (ch<>' ') do
      begin
         s[i]:=s[i]+ch;
         read(ch);
      end;
      readln(num[i]);
   end;
   qsort(1,n);
   s[n+1]:='zzzzzzzzzz';
   for i:=1 to m do
   begin
      read(ch);
      str:='';
      k:=1;
      left:=1; right:=n+1;
      while (ch<>' ') do
      begin
         str:=str+ch;
         searchleft(k,str);
         searchright(k,str);
         inc(k);
         read(ch);
      end;
      readln(x);
      ans:=0;
      for k:=left to right-1 do
        if num[k]>=x then inc(ans);
      writeln(ans);
   end;
   close(input);
   close(output);
end.
