var n,k,ans,t,sum:int64;
    a:array[0..5] of int64;
    i,f:longint;
begin
        assign(input,'sugar.in');reset(input);
        assign(output,'sugar.out');rewrite(output);
        read(n);
        for i:=0 to n div 2 do
        begin
                t:=i;
                for f:=0 to (n-i*2) div 5 do
                        begin
                        if (t=0)and(f=0) then sum:=sum+1;
                        if (t=0)and(f<>0) then sum:=sum+f+1;
                        if (t<>0)and(f=0) then sum:=sum+(t+1)*(t+2)div 2;
                        if (t<>0)and(f<>0) then sum:=sum+(f+1)*(t+1)*(t+2) div 4;
                        end;
        end;
        for i:=0 to 5 do
                begin
                if i>n then break;
                k:=n-i;
                a[i]:=((k+k mod 5)*(k div 5+1) div 4)+(k div 5)+1;
                end;
        ans:=a[0]+(a[1]+a[2]+a[3]+a[4])*2+a[5];
        if n<=10 then writeln(sum)
                 else writeln(ans);
        close(input);
        close(output);
end.