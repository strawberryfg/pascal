var n,num:byte;
    str:string[26];
    hash:packed array['A'..'Z'] of byte;
procedure try(dep:byte;s:string[26];b:char);
          var a:char;
          begin
          if s=str then begin
                        rewrite(output);
                        writeln(num);
                        close(output);
                        halt;
                        end
                   else if dep<=n then
                        begin
                        if dep<>1 then try(dep+1,s,b);
                        if dep=1 then b:=char(ord(b)+1);
                        for a:=b to char(ord('A')+n-1) do
                            begin
                            if hash[a]=0 then begin
                                              num:=num+1;
                                              hash[a]:=1;
                                              try(dep+1,s+a,char(ord(a)+1));
                                              hash[a]:=0;
                                              end;
                            end;
                        end;
          end;
begin
assign(input,'charcom.in');
assign(output,'charcom.out');
reset(input);
readln(n);
readln(str);
close(input);
try(1,'',char(ord('A')-1));
end.
