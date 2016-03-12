program sdf;
var
i,j,k,m,n,la,lb,c:longint;
a,b:array[1..200] of longint;
u,u2,u3:array[0..9] of boolean;
a1,b1,st:string;
f1,f2,f3,f11:boolean;
begin
  assign(input,'friends.in');
  assign(output,'friends.out');
  reset(input);
  rewrite(output);
  readln(n);
  for k:=1 to n do begin
     readln(st);
      c:=pos(' ',st);
      la:=c-1;
      for i:=1 to c-1 do
      a[i]:=ord(st[i])-ord('0');
      lb:=0;
      for i:=c+1 to length(st) do
       begin
       inc(lb);
       b[lb]:=ord(st[i])-ord('0');
     end;
   fillchar(u,sizeof(u),0);
   for i:=1 to la do
      u[a[i]]:=true;
   f1:=true;
   for i:=1 to  lb do
        if u[b[i]]<>true then f1:=false;
   fillchar(u,sizeof(u),0);
   for i:=1 to lb do
      u[b[i]]:=true;
   for i:=1 to  la do
        if u[a[i]]<>true then f1:=false;
   if f1 then begin
       writeln('friends');
            continue;
            end;
    fillchar(u,sizeof(u),0);
    for i:=1 to la do
      u[a[i]]:=true;
   f3:=false;
   for i:=1 to lb-1 do
        begin
          if (b[i+1]<>0)and(b[i]<>9) then begin
          inc(b[i]);
          dec(b[i+1]);
          f2:=true;
           fillchar(u2,sizeof(u2),0);
           for j:=1 to lb do
            u2[b[j]]:=true;
          for j:=0 to 9 do
            if u[j]<>u2[j] then f2:=false;

          dec(b[i]);
          inc(b[i+1]);
          if f2 then f3:=true;end;
          f2:=true;
          if ((i<>1)or(b[i]<>1))and(b[i+1]<>9) then  begin
           dec(b[i]);
          inc(b[i+1]);
            fillchar(u2,sizeof(u2),0);
           for j:=1 to lb do
            u2[b[j]]:=true;
          for j:=0 to 9 do
            if u[j]<>u2[j] then f2:=false;
            inc(b[i]);
          dec(b[i+1]);
                  if f2 then f3:=true; end;
      end;
  fillchar(u,sizeof(u),0);
  for i:=1 to lb do
     u[b[i]]:=true;
  for i:=1 to la-1 do
        begin
          if (a[i+1]<>0)and(a[i]<>9) then begin
          inc(a[i]);
          dec(a[i+1]);
          f2:=true;
          fillchar(u2,sizeof(u2),0);
           for j:=1 to la do
            u2[a[j]]:=true;
          for j:=0 to 9 do
            if u[j]<>u2[j] then f2:=false;
          dec(a[i]);
          inc(a[i+1]);
          if f2 then f3:=true; end;
           f2:=true;
          if ((i<>1)or(a[i]<>1))and(a[i+1]<>9) then  begin
           dec(a[i]);
          inc(a[i+1]);
             fillchar(u2,sizeof(u2),0);
           for j:=1 to la do
            u2[a[j]]:=true;
          for j:=0 to 9 do
            if u[j]<>u2[j] then f2:=false;
            inc(a[i]);
          dec(a[i+1]);
                  if f2 then f3:=true;   end;
      end;
                if f3 then writeln('almost friends')
              else writeln('nothing');
  end;
  close(input);
  close(output);
end.
