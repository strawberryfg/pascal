var n,text,j,len,k,first:longint;
    a:array[0..9]of longint;

    procedure into(num,num1,start:longint);
        begin
        a[0]:=num1;
        a[1]:=num;  a[2]:=num;  a[3]:=num;  a[4]:=num;  a[5]:=num;
        a[6]:=num;  a[7]:=num;  a[8]:=num;  a[9]:=num;
        first:=start;
        end;

begin

assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);

    readln(n);
    text:=n;
    while text>=10 do
          begin
          inc(len);
          text:=text div 10;
          end;
    inc(len);
    case len of
      1:into(0,0,1);
      2:into(1,0,10);
      3:into(18,9,100);
      4:into(300,189,1000);
      5:into(4000,2899,10000);
      6:into(50000,38889,100000);
      7:into(600000,488889,1000000)
    end;
    for j:=first to n do
        begin
        k:=j;
        while k>=10 do begin inc(a[k mod 10]);k:=k div 10; end;
        inc(a[k]);
        end;
    for j:=0 to 9 do
        writeln(a[j]);

close(input);
close(output);

end.