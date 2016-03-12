var n,m,i,j,sum,l,low,high,mid:longint;
    ts,s,ss:string;
    str:array[1..100000]of string[10];
    p,hash:array[1..100000]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
         t:string;
      begin
         i:=l;
         j:=r;
         x:=p[(l+r) div 2];
         repeat
           while p[i]>x do
            inc(i);
           while x>p[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=p[i];
                p[i]:=p[j];
                p[j]:=y;
                t:=str[i];
                str[i]:=str[j];
                str[j]:=t;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'engzam.in');
reset(input);
assign(output,'engzam.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    readln(s);
    j:=pos(' ',s);ts:=copy(s,1,j-1);str[i]:=ts;
    delete(s,1,j);val(s,p[i]);
    end;
sort(1,n);
for i:=1 to m do
    begin
    readln(ss);
    j:=pos(' ',ss);ts:=copy(ss,1,j-1);s:=ts;
    delete(ss,1,j);val(ss,l);
    if hash[l]<>0 then m:=hash[l]
       else begin
            low:=1;
            high:=n;
            mid:=(low+high)div 2;
            m:=0;
            while (low<=high)do
             begin
             if p[mid]>=l then m:=mid;
             if p[mid]<l then high:=mid-1;
             if p[mid]>=l then low:=mid+1;
             mid:=(low+high)div 2;
             end;
            hash[l]:=m;
            end;
    sum:=0;
    for j:=m downto 1 do
        begin
        if length(str[j])<length(s) then continue;
        ts:=copy(str[j],1,length(s));
        if ts=s then inc(sum);
        end;
    writeln(sum);
    end;
close(input);
close(output);
end.
