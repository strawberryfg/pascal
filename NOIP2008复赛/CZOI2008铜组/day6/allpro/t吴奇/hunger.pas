program hunger;
type food=record
     sum,num:longint;
     end;
     tlist=array[1..2000]of food;
var n,i,s,j:longint;
    f:boolean;
    a:array[1..2000,1..2]of longint;
    all:tlist;
function try(x,y:longint):boolean;
begin
     if a[x,1]<=a[y,1] then if a[x,2]>=a[y,1] then exit(true)
                                              else exit(false)
                       else if a[x,1]<=a[y,2] then exit(true)
                                              else exit(false);
end;
procedure qsort(var a : tlist);

    procedure sort(l,r: longint);
      var
         i,j: longint;
         x,y:food;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i].sum<x.sum do
            inc(i);
           while x.sum<a[j].sum do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
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
       sort(1,n);
    end;
begin
assign(input,'hunger.in');reset(input);
assign(output,'hunger.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
    read(a[i,1],a[i,2]);
end;
for i:=1 to n do
begin
     all[i].sum:=a[i,2]-a[i,1]+1;
     all[i].num:=i;
end;
    qsort(all);
    s:=s+all[n].sum;
    for i:=n-1 downto 1 do
       begin
            j:=n;
            for j:=n downto i+1 do while (j>i+1)and not(f) do
            begin
                 f:=try(all[i].num,all[j].num);
            end;
            if not(f) then s:=all[i].sum+s;
       end;
    writeln(s);
    close(input);
    close(output);
end.