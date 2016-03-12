Var n,m,i,j,l,sum:longint;
    s,s1:string;
    flag:boolean;
    a:array[1..10000]of string;
    b:array[1..10000]of longint;
Procedure sort(l,r: longint);
      var
         i,j,m: longint;
         x,y: string;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                m:=b[i];
                b[i]:=b[j];
                b[j]:=m;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
Begin
  assign(input,'engzam.in');reset(input);
  assign(output,'engzam.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(s);
      a[i]:=copy(s,1,pos(' ',s)-1);
      val(copy(s,pos(' ',s)+1,length(s)-length(a[i])),b[i]);
    end;
  sort(1,n);
  for i:=1 to m do
    begin
      readln(s);
      s1:=copy(s,1,pos(' ',s)-1);
      val(copy(s,pos(' ',s)+1,length(s)-length(a[i])),l);
      flag:=false;
      sum:=0;
      for j:=1 to n do
        if s1=copy(a[j],1,length(s1)) then if b[j]>=l then begin flag:=true;inc(sum);end else
			              else if flag then break;
      writeln(sum);
    end;
  close(output);
End.
