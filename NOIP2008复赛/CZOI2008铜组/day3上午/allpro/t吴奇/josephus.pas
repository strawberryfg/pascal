program josephus;
var k,m,i,j,t,min,s,n:longint;
    now,out:boolean;
    b:array[1..14]of longint;
    a:array[1..800]of longint;
procedure redo;
begin
fillchar(a,sizeof(a),0);
fillchar(b,sizeof(b),0);
 for i:=1 to m do
     begin
     a[i]:=i mod (2*k);
     if a[i]=0 then a[i]:=2*k;
     end;
end;
procedure findnext(n:longint);
var x:longint;
begin
x:=n;
 while a[n+m-1]=0 do
              begin
                   out:=false;
                   if s>2*k then s:=1;
                   for j:=1 to i do
                   if s=b[j] then out:=true;
                   while out do
                   begin
                   out:=false;
                   inc(s);
                   if s>2*k then s:=1;
                   for j:=1 to i do
                   if s=b[j] then out:=true;
                   end;
                   a[x]:=s;
                   inc(x);
                   inc(s);
              end;
end;
begin
     assign(input,'josephus.in');reset(input);
     assign(output,'josephus.out');rewrite(output);
     read(k);
     redo;
     min:=0;
     m:=k+1;
     while min=0 do
     begin
         redo;
         now:=true;
         s:=m+1;
         for i:=1 to k do
         begin
              b[i]:=a[m*i];
              if b[i]<k+1 then begin
                                       now:=false;
                                 end;
              findnext(m*i+1);
         end;
         if now then min:=m;
         inc(m);
     end;
     writeln(min);
     close(input);
     close(output);
end.
