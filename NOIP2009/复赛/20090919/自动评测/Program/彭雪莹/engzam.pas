var h,z:array['a'..'z',0..10] of longint;
    ch,a:char;
    s:array[1..10] of string;
    p:array[1..10] of longint;
    i,n,m,l,x,c,ans,j,xx:longint;
    s2,s3,ss:string;
{procedure sort(ch:char; l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=h[ch,(l+r) div 2];
         repeat
           while h[ch,i]<x do
            inc(i);
           while x<h[ch,j] do
            dec(j);
           if not(i>j) then
             begin
                y:=h[ch,i];
                h[ch,i]:=h[ch,j];
                h[ch,j]:=y;
                z[ch,h[ch,i]]:=j;
                z[ch,h[ch,j]]:=i;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(ch,l,j);
         if i<r then
           sort(ch,i,r);
      end;
}

begin
  assign(input,'engzam.in');
  assign(output,'engzam.out');
  reset(input);
  rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
    readln(s2);
    x:=pos(' ',s2);
    s[i]:=copy(s2,1,x-1);
    s3:=copy(s2,x+1,length(s2)-x);
    val(s3,x,c);
    p[i]:=x;
    a:=s[i,1];
    inc(h[a,0]);
    h[a,h[a,0]]:=i;
    end;
  for i:=1 to m do
    begin
    readln(s2);
    x:=pos(' ',s2);
    ss:=copy(s2,1,x-1);
    s3:=copy(s2,x+1,length(s2)-x);
    val(s3,x,c);
    a:=ss[1];
    ans:=0;
    for j:=1 to h[a,0] do begin
          xx:=pos(ss,s[h[a,j]]);
          if xx<>0 then if p[h[a,j]]>=x then inc(ans);
          end;
    writeln(ans);
    end;
  close(input);
  close(output);
end.
