var i,n,k,c,p,q,l,r,min,sum:longint;
    a,b:array[0..100000] of longint;

procedure work(last:longint);
          var dep:longint;
          begin
            sum:=0;
            for dep:=1 to r do
                begin
                 inc(sum,c+sqr(a[last+b[dep]]-a[last]));
                 inc(last,b[dep])
                end;
            if sum<min then min:=sum;
          end;

procedure find(dep,last,left:longint);
          var i:longint;
          begin
            if dep>r-1 then begin b[r]:=left;work(1);end
               else  for i:=last to left do
                         begin
                          b[dep]:=i;
                          find(dep+1,i,left-i);
                         end;
          end;

procedure sort(l,r:longint);
          var i,j,x,y:longint;
          begin
           x:=a[(l+r)div 2];
           i:=l;
           j:=r;
           repeat
            while a[i]<=x do inc(i);
            while a[j]>=x do dec(j);
            if i<=j then
               begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                dec(j);
               end;
           until i>j;
           if i<r then sort(i,r);
           if l<j then sort(l,j);
          end;

begin
assign(input,'divide.in');reset(input);
assign(output,'divide.out');rewrite(output);
 min:=maxlongint;
 readln(n,k,c);
 for i:=1 to n do
     read(a[i]);
 sort(1,n);
 p:=n mod k;
 q:=n div k;
 for r:=1 to q do
     begin
      l:=n-k*r;
      find(1,0,l);
     end;
 writeln(min);
close(input);
close(output);
end.
