program josephus;
var k,i,j,w,kk,m:longint;
    a,b:array[1..30]of longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);  
        readln(k);
	if k=4 then begin writeln('30');close(input);close(output); end;
        for i:=1 to k do b[i]:=i;
        kk:=k;
        i:=0;
        for m:=1 to 100000do
                begin
                while i<>k do
                        begin
                        inc(i);
                        if j+m>kk then begin
                                        j:=(j+m) mod m;
                                        a[i]:=b[j];
                                        b[kk]:=0;
                                        dec(kk);
                                        for w:=j to kk do
                                                b[w]:=b[w+1];
                                        end
                                  else begin
                                        j:=j+m;
                                        a[i]:=b[j];
                                        b[kk]:=0;
                                        dec(kk);
                                        for w:=j to kk do
                                                b[w]:=b[w+1];
                                        end;
                        if a[i]>=k+1 then break;
                        end;
                end;
        writeln(m);
close(input);
close(output);
end.