const maxn=2000;
type arraytype=array [1..maxn] of longint;
var i,j,k,m,n,p,lz,area,maxarea:longint;
    s:string;
    flag:boolean;
    h,l,r:arraytype;
    fin:text;
begin
     assign(fin,'percal.in');
     reset(fin);
     readln(fin,n);
     maxarea:=0;
     for i:=1 to n do h[i]:=0;
     for i:=1 to n do l[i]:=1;
     for i:=1 to n do r[i]:=n;
     for i:=1 to n do
     begin
          flag:=true; lz:=1; j:=1;
          for m:=1 to (2*n-2) div 255+1 do
          begin
               if m<=(2*n-2) div 255
                  then begin read(fin,s); s[0]:=chr(255) end
                  else readln(fin,s);
               if odd(m) then p:=1 else p:=2;
               while p<=length(s) do
               begin
                    if s[p]='1'
                       then begin
                                 if h[j]>0 then
                                    begin h[j]:=0; l[j]:=1; r[j]:=n end;
                                 if flag then
                                    begin
                                         flag:=false;
                                         for k:=lz to j-1 do
                                         begin
                                              h[k]:=h[k]+1;
                                              if l[k]<lz then l[k]:=lz;
                                              if r[k]>j-1 then r[k]:=j-1;
                                              area:=h[k]*(r[k]-l[k]+1);
                                              if area>maxarea
                                                 then maxarea:=area
                                         end
                                    end
                            end
                       else if not(flag)
                               then begin lz:=j; flag:=true end;
                    p:=p+2;
                    j:=j+1;
               end
          end;
          if flag then
             for k:=lz to n do
             begin
                  h[k]:=h[k]+1;
                  if l[k]<lz then l[k]:=lz;
                  area:=h[k]*(r[k]-l[k]+1);
                  if area>maxarea
                     then maxarea:=area
             end;
     end;
     close(fin);
     assign(output,'percal.out');
     rewrite(output);
     writeln(maxarea);
     close(output)
end.
