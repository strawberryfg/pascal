 const maxn=100;
 type arr=array[0..maxn]of longint;
 var a:arr;
     n,k,total:longint;
 procedure try(dep:longint);
 var i,j,s,t:longint;
 begin
 i:=0; j:=0; s:=0;
 if dep=k then begin for i:=1 to k-1 do s:=s+a[i];
              s:=n-s;
              if s<=a[dep-1] then begin a[dep]:=s;inc(total);end;
              end
         else begin
              for i:=1 to dep-1 do s:=s+a[i];
              j:=n-s;
              s:=s+(k-dep); s:=n-s;
              if dep<k then while j mod (k-dep) <>0 do
                                  inc(j);
              j:=j div (k-dep+1);
              for i:=s downto j do
                  begin
                  a[dep]:=i;
                  if a[dep]<=a[dep-1] then try(dep+1)
                                      else if dep<k then begin
                                                         t:=a[dep]-a[dep-1];
                                                         a[dep]:=a[dep-1];
                                                         a[dep+1]:=a[dep+1]+t;
                                                         end
                                                    else try(1);
                  end;
              end;
 end;
 begin
 readln(n,k);
 a[0]:=n-(k-1);
 try(1);
 writeln(total);
 end.
