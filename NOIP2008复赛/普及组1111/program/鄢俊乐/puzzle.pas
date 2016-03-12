var p:array[1..3,1..3,1..9] of longint;
    t,r,i,j,k,l,m:longint;
procedure check1(a1,a2,b1,b2,c1,c2:longint);
          var t1,t2,i,j:longint;
          begin
          for i:=1 to 9 do
              if (p[a1,a2,i]>0) and (p[b1,b2,i]>0) and (p[c1,c2,i]=0)
                 then begin
                      t1:=4-(p[a1,a2,i]-1) div 3-(p[b1,b2,i]-1) div 3;
                      t2:=9*t1-3;
                      for j:=1 to 9 do
                          if (p[c1,c2,j]=t1*3) or (p[c1,c2,j]=t1*3-1) or (p[c1,c2,j]=t1*3-2)
                             then t2:=t2-p[c1,c2,j];
                      if (t2=t1*3) or (t2=t1*3-1) or (t2=t1*3-2)
                         then begin
                              dec(r);
                              p[c1,c2,i]:=t2;
                              end;
                      end;
          end;
procedure check2(a1,a2,b1,b2,c1,c2:longint);
          var t1,t2,i,j:longint;
          begin
          for i:=1 to 9 do
              if (p[a1,a2,i]>0) and (p[b1,b2,i]>0) and (p[c1,c2,i]=0)
                 then begin
                      t1:=4-(p[a1,a2,i]-1) mod 3-(p[b1,b2,i]-1) mod 3;
                      t2:=3*t+9;
                      for j:=1 to 9 do
                          if (p[c1,c2,j]=t1) or (p[c1,c2,j]=t1+3) or (p[c1,c2,j]=t1+6)
                             then t2:=t2-p[c1,c2,j];
                      if (t2=t1) or (t2=t1+3) or (t2=t1+6)
                         then begin
                              dec(r);
                              p[c1,c2,i]:=t2;
                              end;
                      end;
          end;
begin
assign(input,'puzzle.in');
reset(input);
for i:=1 to 9 do
    for j:=1 to 9 do
        begin
        read(t);
        if t=0
           then inc(r)
           else p[(i-1) div 3+1,(j-1) div 3+1,t]:=(i-(i-1) div 3*3-1)*3+j-(j-1) div 3*3;
        end;
close(input);
while r>0 do
      for i:=1 to 3 do
          begin
          check1(i,1,i,2,i,3);
          check1(i,1,i,3,i,2);
          check1(i,2,i,3,i,1);
          check2(1,i,2,i,3,i);
          check2(1,i,3,i,2,i);
          check2(2,i,3,i,1,i);
          end;
assign(output,'puzzle.out');
rewrite(output);
for i:=1 to 3 do
    for j:=1 to 3 do
        begin
        for k:=1 to 2 do
            for l:=1 to 3 do
                begin
                for m:=1 to 9 do
                    if p[i,k,m]=(j-1)*3+l
                       then break;
                write(m,' ');
                end;
        for k:=1 to 2 do
            begin
            for l:=1 to 9 do
                if p[i,3,l]=(j-1)*3+k
                   then break;
            write(l,' ');
            end;
        for k:=1 to 9 do
            if p[i,3,k]=(j-1)*3+3
               then break;
        writeln(k);
        end;
close(output);
end.
