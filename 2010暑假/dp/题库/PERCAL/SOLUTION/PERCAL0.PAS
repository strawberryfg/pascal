const maxn=2000;
type arraytype=array [1..maxn] of longint;
var e,i,j,k,m,n,p,lz,area,maxarea:longint;
    flag:boolean;
    h,l,r:arraytype;
begin
     assign(input,'percal.in');
     reset(input);
     read(n);
     maxarea:=0;
     for i:=1 to n do h[i]:=0;
     for i:=1 to n do l[i]:=1;
     for i:=1 to n do r[i]:=n;
     for i:=1 to n do
     begin
          flag:=true; lz:=1; j:=1;
          while j<=n do
          begin
               read(e);
               if e=1
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
                  j:=j+1;
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
     close(input);
     assign(output,'percal.out');
     rewrite(output);
     writeln(maxarea);
     close(output)
end.
