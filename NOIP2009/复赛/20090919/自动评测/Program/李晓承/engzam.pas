program asdf;
var
    sum:array[1..26]of integer;
    s:array[1..26,0..100000]of string[12];
    a:array[1..26,0..100000]of longint;
    ans,n,m,i,j,app,c,k:longint;
    ss,t:string;
    judge:boolean;
procedure sort(c,l,r:longint);
    var
      temp1:string;
      i,j,temp,m:longint;
    begin
      i:=l;j:=r;m:=a[c,(l+r) div 2];
      repeat
        while a[c,i]<m do inc(i);
        while a[c,j]>m do dec(j);
        if i<=j then
          begin
           temp:=a[c,i];a[c,i]:=a[c,j];a[c,j]:=temp;
           temp1:=s[c,i];s[c,i]:=s[c,j];s[c,j]:=temp1;
           inc(i);dec(j);
          end;
      until i>j;
      if l<j then sort(c,l,j);
      if i<r then sort(c,i,r);
    end;
begin
      assign(input,'engzam.in');reset(input);
      assign(output,'engzam.out');rewrite(output);
      readln(n,m);
      for i:=1 to n do
       begin
         readln(t);
         c:=ord(t[1])-ord('a')+1;
         inc(sum[c]);
         s[c,sum[c]]:=copy(t,1,pos(' ',t)-1);
         a[c,sum[c]]:=0;
         for j:=pos(' ',t)+1 to length(t) do
           a[c,sum[c]]:=a[c,sum[c]]*10+ord(t[j])-ord('0');
       end;
      for i:=1 to 26 do
       if sum[i]>1 then sort(i,1,sum[i]);
      for i:=1 to m do
        begin
            readln(t);
            ss:=copy(t,1,pos(' ',t)-1);
            c:=ord(t[1])-ord('a')+1;
            app:=0;
            for j:=pos(' ',t)+1 to length(t) do
               app:=app*10+ord(t[j])-ord('0');
	    ans:=0;
            for j:=sum[c] downto 1 do
             if a[c,j]<app then break
                           else
                             begin
                              if length(s[c,j])>=length(ss) then
                              begin
                              judge:=true;
                              for k:=1 to length(ss) do
                                   if ss[k]<>s[c,k] then begin judge:=false;break; end;
                              if judge then inc(ans);
                              end;
                            end;
            writeln(ans);
        end;
      close(input);close(output);
end.
