var     a:array[0..200]of real;
        b:array[0..200,1..2]of longint;
        l,f,g,i,j,t:longint;
        h:real;
begin
        assign(input,'lifts.in');
        reset(input);
        assign(output,'lifts.out');
        rewrite(output);
        readln(l,f);
        for i:=1 to l do
                readln(b[i,1],b[i,2]);
        for i:=1 to l-1 do
                for j:=i+1 to l do
                if b[i,2]<=b[j,2] then
                begin
                        t:=b[i,1];b[i,1]:=b[j,1];b[j,1]:=t;
                        t:=b[i,2];b[i,2]:=b[j,2];b[j,2]:=t;
                end;
        b[0,1]:=f;b[0,2]:=f;
        b[l+1,1]:=1;b[l+1,2]:=1;
        for i:=1 to l+1 do a[i]:=1e+10;
        for i:=1 to l+1 do
                for j:=0 to i-1 do
                if b[j,1]<=b[i,2] then
                begin
                        if 2*b[j,1]>=b[i,1]+b[i,2]
                                then g:=b[j,1]
                                else g:=(b[i,1]+b[i,2]) div 2;
                        h:=a[j]+((b[i,2]-g)*(b[i,2]-g+1)+(g-b[i,1])*(g-b[i,1]+1))/(b[i,2]-b[i,1]+1)/2;
                        if a[i]>h then a[i]:=h;
                end;
        writeln(a[l+1]+f-1:0:5);
        close(input);
        close(output);
end.