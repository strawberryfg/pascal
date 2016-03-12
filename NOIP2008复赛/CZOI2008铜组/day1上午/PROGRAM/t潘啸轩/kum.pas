var
        a:array[1..10000] of longint;
        s,n,k,i:longint;

procedure sort(l,r:longint);
var x,mid,i,j:longint;
begin
        i:=l; j:=r; mid:=a[(l+r) div 2];
        repeat
          while a[i]<mid do inc(i);
          while a[j]>mid do dec(j);
          if i<j then
                 begin
                        x:=a[i]; a[i]:=a[j]; a[j]:=x;
                        inc(i); dec(j)
                 end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r)
end;

begin
        assign(input,'knum.in'); assign(output,'knum.out');
        reset(input); rewrite(output);
        readln(n,k);
        for i:=1 to n do readln(a[i]);
        sort(1,n);
        s:=n-k+1;
        writeln(a[s]);
        close(input); close(output)
end.
