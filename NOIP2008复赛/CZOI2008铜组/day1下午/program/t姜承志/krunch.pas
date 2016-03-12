var first,final:string[70];
    hash:packed array['A'..'Z']of byte;
    l,ll,e:byte;
begin
assign(input,'krunch.in');
assign(output,'krunch.out');
reset(input);
readln(first);
close(input);
l:=1;
ll:=1;
e:=length(first);
repeat
       if (first[l]=' ')and(final[ll-1]<>' ')and(ll<>1)and(ll<>e)
          then begin
               final:=final+' ';
               ll:=ll+1;
               end
          else begin
               if first[l]=' ' then begin l:=l+1; continue;end;
               if (ord(first[l])<65)or (ord(first[l])>90) then begin
                                                              final:=final+first[l];
                                                              ll:=ll+1;
                                                              l:=l+1;
                                                              continue;
                                                              end;
               if (hash[first[l]]=0)and not(first[l] in['A','E','I','O','U']) then begin
                                    hash[first[l]]:=1;
                                    final:=final+first[l];
                                    ll:=ll+1;
                                    end;
               end;
l:=l+1;
until l=e+1;
rewrite(output);
writeln(final);
close(output);
end.