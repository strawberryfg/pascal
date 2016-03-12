var n,t,i,tt:longint;
    strr:string;
    f:array[0..200,0..200]of longint;
    final:array[0..200,0..200]of string;
function fun(l,r:longint):longint;
var knum,fmin,i,j,k,len,t1,t2,nowmax,nowlen,now:longint;
    tmp:string;
    pd,mark:boolean;
begin
if f[l,r]<>0 then exit(f[l,r]);
if (l=r) then begin f[l,r]:=1; final[l,r]:=strr[l];exit(f[l,r]); end;
fmin:=r-l+1;
knum:=0;
pd:=false;
nowlen:=r-l+1;
for i:=1 to nowlen div 2 do
    begin
    if nowlen mod i<>0 then continue;
    now:=nowlen div i;
    mark:=true;
    for j:=1 to now do
        begin
        for k:=1 to i do
            begin
            if strr[(j-1)*i+l+k-1]<>strr[l+k-1] then
               begin mark:=false;break; end;
            end;
        end;
    if mark then
       begin

       t1:=fun(l,l+i-1);
       str(nowlen div i,tmp);
       t1:=t1+length(tmp)+2;
       if t1<fmin then
          begin
          fmin:=t1;
          nowmax:=i;
           pd:=true;
          final[l,r]:=tmp+'('+final[l,l+nowmax-1]+')';
          end;

       end;
    end;
for i:=l to r-1 do
    begin
    t1:=fun(l,i); t2:=fun(i+1,r);
    if t1+t2<fmin then
       begin
       fmin:=t1+t2;
       knum:=i;
       end;
    end;
if (knum=0) then
   begin
   if not pd then
      begin
      f[l,r]:=fmin;
      final[l,r]:='';
      for i:=l to r do final[l,r]:=final[l,r]+strr[i];
      end
   else f[l,r]:=fmin;
   end
else
     begin
     f[l,r]:=fmin;
     len:=length(final[l,knum]);
     final[l,r]:='';
     for i:=1 to len do
         begin
         final[l,r]:=final[l,r]+final[l,knum,i];
         end;
     len:=length(final[knum+1,r]);
     for i:=1 to len do
        begin
        final[l,r]:=final[l,r]+final[knum+1,r,i];
        end;
     end;
exit(f[l,r]);
end;
begin
assign(input,'folding.in');
reset(input);
assign(output,'folding.out');
rewrite(output);
readln(strr);
n:=length(strr);
t:=fun(1,n);
writeln(final[1,n]);
close(input);
close(output);
end.
