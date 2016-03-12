var     a,b:array[1..40,1..40]of longint;
        i,j,k,c,t,h,w:longint;
procedure change(x,y,z:longint);
var     z1:longint;
begin
        z1:=b[x,y];
        b[x,y]:=z;
        if x>1 then if b[x-1,y]=z1 then change(x-1,y,z);
        if x<h then if b[x+1,y]=z1 then change(x+1,y,z);
        if y>1 then if b[x,y-1]=z1 then change(x,y-1,z);
        if y<w then if b[x,y+1]=z1 then change(x,y+1,z);
end;
begin
        assign(input,'stables.in');
        reset(input);
        assign(output,'stables.out');
        rewrite(output);
        readln(w,h);
        for i:=1 to h do
                for j:=1 to w do
                        read(a[i,j]);
        for k:=1 to 100 do
        for i:=1 to h do
                for j:=1 to w do
                        if a[i,j]=k then
                        begin
                                inc(c);
                                if b[i,j]=0 then b[i,j]:=c;
                                if i>1 then if b[i-1,j]=0
                                        then begin b[i-1,j]:=b[i,j];inc(t,k); end
                                        else if b[i-1,j]<>b[i,j] then begin change(i-1,j,b[i,j]); inc(t,k); end;
                                if i<h then if b[i+1,j]=0
                                        then begin b[i+1,j]:=b[i,j];inc(t,k); end
                                        else if b[i+1,j]<>b[i,j] then begin change(i+1,j,b[i,j]); inc(t,k); end;
                                if j>1 then if b[i,j-1]=0
                                        then begin b[i,j-1]:=b[i,j];inc(t,k); end
                                        else if b[i,j-1]<>b[i,j] then begin change(i,j-1,b[i,j]); inc(t,k); end;
                                if j<w then if b[i,j+1]=0
                                        then begin b[i,j+1]:=b[i,j];inc(t,k); end
                                        else if b[i,j+1]<>b[i,j] then begin change(i,j+1,b[i,j]); inc(t,k); end;
                        end;
        writeln(t);
        close(input);
        close(output);
end.
