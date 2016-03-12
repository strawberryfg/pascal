var
        s:string;
        sum,i,j,k,len:longint;
begin
        assign(input,'broj.in'); assign(output,'broj.out');
        reset(input); rewrite(output);
        readln(s); sum:=0;
        len:=length(s);
        k:=ord(s[len])-ord('0')+1;
        inc(sum,k*len);
	if len>2 then for i:=len downto 2 do inc(sum,10*i);
        if len>1 then inc(sum,9);
        writeln(sum);
        close(input); close(output)
end.
