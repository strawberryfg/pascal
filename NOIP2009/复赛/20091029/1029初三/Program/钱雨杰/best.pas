var n,num,sum,max,i:longint;
    ans,s:string;
    a:array[1..60] of longint;

    function cheng(a,b:string):string;
      var i,j:longint;
      begin
      cheng:='';
      for i:=1 to 100 do cheng:=cheng+'0';
      s:=''; for i:=1 to length(a) do s:=a[i]+s;  a:=s;
      s:=''; for i:=1 to length(b) do s:=b[i]+s;  b:=s;
      for i:=1 to length(a) do
          for j:=1 to length(b) do
              cheng[100-(i+j-1)+1]:=chr(ord(cheng[100-(i+j-2)])+(ord(a[i])-48)*(ord(b[j])-48));
      for i:=100 downto 1 do
          while ord(cheng[i])>57 do
             begin
             cheng[i-1]:=chr((ord(cheng[i-1])-48)+((ord(cheng[i])-48) div 10)+48);
             cheng[i]:=chr(((ord(cheng[i])-48) mod 10)+48);
             end;
      while cheng[1]='0' do delete(cheng,1,1);
      end;

begin
assign(input,'best.in');
reset(input);
assign(output,'best.out');
rewrite(output);
    readln(n);
    num:=1; a[num]:=2; sum:=2;
    while sum+a[num]+1<=n do
       begin
       inc(num);
       a[num]:=a[num-1]+1;
       sum:=sum+a[num];
       end;
    a[num+1]:=n-sum; max:=a[num];
    if a[num+1]<>0 then if max=a[num+1] then inc(a[1],a[num+1])
                                        else inc(a[max+1-a[num+1]-1],a[num+1]);
    ans:='1';
    for i:=1 to num do
        begin
        str(a[i],s);
        ans:=cheng(ans,s);
        end;
    if n=1 then writeln(1) else writeln(ans);
close(input);
close(output);
end.