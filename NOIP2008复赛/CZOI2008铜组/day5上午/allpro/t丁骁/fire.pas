var
     i,j,n,m,h,l,sum,num,min:longint;
     a:array[0..11,0..11] of char;
function pd:boolean;
begin
     pd:=false;
     for i:=1 to n do
         for j:=1 to n do
             if a[i,j]='.' then begin pd:=true;break;end;
end;
function k(i,j:longint):longint;
begin
     k:=0;
     {zuo}
     for i:=l-1 downto 1 do
         if a[h,i]='X' then break
                       else inc(k);
     {you}
     for i:=l+1 to n do
         if a[h,i]='X' then break
                       else inc(k);
     {shang}
     for i:=h-1 downto 1 do
         if a[i,l]='X' then break
                       else inc(k);
     {xia}
     for i:=h+1 to n do
         if a[i,l]='X' then break
                       else inc(k);;
end;
procedure find;
begin
     h:=0; l:=0; min:=100000;
     for i:=1 to n do
         for j:=1 to n do
             if (a[i,j]='.')and(k(i,j)<min) then
                begin
                min:=k(i,j);
                h:=i; l:=j;
                end;
end;
procedure q(h,l:longint);
begin
     {zuo}
     for i:=l-1 downto 1 do
         if a[h,i]='X' then break
                       else a[h,i]:='2';
     {you}
     for i:=l+1 to n do
         if a[h,i]='X' then break
                       else a[h,i]:='2';
     {shang}
     for i:=h-1 downto 1 do
         if a[i,l]='X' then break
                       else a[i,l]:='2';
     {xia}
     for i:=h+1 to n do
         if a[i,l]='X' then break
                       else a[i,l]:='2';
end;
begin
     assign(input,'fire.in');
     assign(output,'fire.out');
     reset(input);
     rewrite(output);

     readln(n);
     for i:=1 to n do
         begin
         for j:=1 to n do
             read(a[i,j]);
         readln;
         end;
     while pd do
           begin
           find;
           a[h,l]:='t';
           q(h,l);
           end;
     for i:=1 to n do
         for j:=1 to n do
             if a[i,j]='t' then inc(sum);
     writeln(sum);

     close(input);
     close(output);
end.
