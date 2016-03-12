var m,n,i,j,t,k:longint;
    a:array['A'..'Z']of longint;
    str1,str2:string;

begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
    readln(m,n);
    fillchar(a,sizeof(a),0);
    readln(str1);
    for i:=m downto 1 do
        a[str1[i]]:=m-i+1;
    readln(str2);
    for i:=1 to n do
        a[str2[i]]:=m+i;
    readln(t);
    if t>m then t:=m;
    if t>n then t:=n;
    if m>k then k:=m;
    if n>k then k:=n;
    if t=k then begin
                writeln(str2);
                for i:=1 to n do
                    write(str1[n-i+1]);
                end
    else begin
    for i:=1 to t do
        begin
        a[str1[i]]:=a[str1[i]]+t-i+1;
        a[str2[i]]:=a[str2[i]]-t+i-1;
        end;
    for i:=1 to m+n do
        begin
        for j:=1 to m do
            if a[str1[j]]=i then begin write(str1[j]); break; end;
        for j:=1 to n do
            if a[str2[j]]=i then begin write(str2[j]); break; end;
        end;end;
    writeln;
close(input);
close(output);
end.
