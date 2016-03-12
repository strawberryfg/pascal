program mysting;
var s,s1,s2:string;
    ch:char;
    i,j,count,max,tmax,min,tmin:longint;
    a:array[1..10000,1..2]of longint;
begin
assign(input,'mystring.in');reset(input);
assign(output,'mystring.out');rewrite(output);
    readln(s);
    j:=1;
    count:=0;
    for i:=1 to length(s) do
    begin
         if s[i]<>' ' then count:=count+1
                      else begin
                                a[j,1]:=count;
                                a[j,2]:=i-count;
                                count:=0;
                                j:=j+1;
                           end;
    end;
     a[j,1]:=count;
         a[j,2]:=i-count+1;
    max:=0;
    min:=maxlongint;
        for i:=1 to j do
        begin
             if a[i,1]>max then begin
                                     max:=a[i,1];
                                     tmax:=i;
                                end;
             if a[i,1]<min then begin
                                     min:=a[i,1];
                                     tmin:=i;
                                end;
        end;
             for i:=a[tmax,2] to (a[tmax,2]+a[tmax,1]-1) do
                 begin
                      write(s[i]);
                      s1:=s1+s[i];
                 end;
                 writeln;
             for i:=a[tmin,2] to (a[tmin,2]+a[tmin,1]-1) do
             begin
                write(s[i]);
                s2:=s2+s[i];
             end;
                writeln;
close(input);
close(output);
end.
