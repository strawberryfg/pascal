var v:array [0..5,0..100000] of boolean;
    ans,i,j,n:longint;

procedure search(x,y:longint);
begin
   if x>4 then
   begin
      inc(ans);
      exit;
   end;
   if y>n then begin search(x+1,1); exit; end;
   if v[x,y]
     then search(x,y+1)
     else begin
             if not v[x,y+1]
               then begin
                       v[x,y]:=true; v[x,y+1]:=true;
                       search(x,y+2);
                       v[x,y]:=false; v[x,y+1]:=false;
                    end;
             if not v[x+1,y]
               then begin
                       v[x,y]:=true; v[x+1,y]:=true;
                       search(x,y+1);
                       v[x,y]:=false; v[x+1,y]:=false;
                    end;
          end;
end;

begin
   assign(input,'bag.in');
   assign(output,'bag.out');
   reset(input);
   rewrite(output);
   fillchar(v,sizeof(v),true);
   readln(n);
   ans:=0;
   for i:=1 to 4 do
     for j:=1 to n do v[i,j]:=false;
   search(1,1);
   writeln(ans);
   close(input);
   close(output);
end.
