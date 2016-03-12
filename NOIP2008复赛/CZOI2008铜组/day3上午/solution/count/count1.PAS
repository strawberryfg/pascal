type a1=array[0..9] of longint;
var a:a1;
    n,chu,chu1,shang,yu,i,j,k:longint;
begin
     assign(input,'count.in');
     reset(input);
     assign(output,'count.out');
     rewrite(output);
     readln(n);
     k:=1;
     chu:=n;
     chu1:=0;
     shang:=n;
     while shang<>0 do
     begin
          chu1:=n-shang*k;
          k:=k*10;
          shang:=chu div 10;
          yu:=chu mod 10;
          for i:=0 to 9 do inc(a[i],shang*(k div 10));
          dec(a[0],k div 10);
          for i:=0 to yu-1 do inc(a[i],k div 10);
          inc(a[yu],chu1+1);
          chu:=chu div 10;
     end;
     for i:=0 to 9 do writeln(a[i]);
end.