var i,sh,sj,j,k,n,max,loc,d,sum:longint;
    t,sup,s:string;
    f:array[1..2500]of boolean;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
readln(sup);
i:=2;
s:=sup[1];
sh:=1; sj:=0;
while i<=n do
      begin
      fillchar(f,sizeof(f),false);
      for j:=i to n do
          begin
          if sup[j]='H' then inc(sh) else inc(sj);
          if abs(sh-sj)<=d then f[j]:=true;
          end;
      for j:=i to n do
          if (f[j]=true)and(j-i+1>max) then begin max:=j-i+1;loc:=j; end;
      t:=copy(sup,i,max);
      t:=s+t;
      if t<>s[i] then begin
                 i:=i+max;inc(sum);s:=sup[loc+1];
                 if s='H' then begin sh:=1;sj:=0; end
                          else begin sj:=1;sh:=0; end
                      end
                 else begin
                      if s[i]='H' then t:='J' else t:='H';
                      k:=i+1;
                      while (k<=n)and(s[k]=t) do
                        inc(k);
                      if k<>i+1 then  begin t:=copy(sup,i,k-1);t:=s+t;i:=k;inc(sum);s:=sup[k];
                                      if s='H' then begin sh:=1;sj:=0; end
                                        else begin sj:=1;sh:=0; end
                                      end
                        else begin inc(i);inc(sum); end;
                 end;
      end;
writeln(sum);
close(input);
close(output);
end.
