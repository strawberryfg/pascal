var i,j,n,wide,len,answer,find:longint;str:string;
    chr:array[1..10,1..10]of char;
    a:array[1..10,1..10]of longint;

   function findfree:longint;
       begin
       for i:=1 to n do
           for j:=1 to n do
               if a[i,j]=3 then begin
                                len:=i; wide:=j;
                                findfree:=1;
                                a[i,j]:=1;
                                exit; end;
       findfree:=0;
       end;

begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output); 

    readln(n);
    for i:=1 to n do
        begin
        readln(str);
        for j:=1 to n do
            begin
            chr[i,j]:=str[j];
            if chr[i,j]='X' then a[i,j]:=0
                            else a[i,j]:=3;
            end;
        end;
    {0--shi qiang  1--diao bao  2--huo li fan wei  3--kong di}
    find:=findfree;
    while find<>0 do
          begin
          a[len,wide]:=1;
          for i:=len+1 to n do
              begin
              if a[i,wide]=0 then break;
              a[i,wide]:=2;
              end;
          for i:=len-1 downto 1 do
              begin
              if a[i,wide]=0 then break;
              a[i,wide]:=2;
              end;
          for i:=wide+1 to n do
              begin
              if a[len,i]=0 then break;
              a[len,i]:=2;
              end;
          for i:=wide-1 downto 1 do
              begin
              if a[len,i]=0 then break;
              a[len,i]:=2;
              end;
          find:=findfree;
          end;
    answer:=0;
    for i:=1 to n do
        for j:=1 to n do
            if a[i,j]=1 then inc(answer);
    writeln(answer);

close(input);
close(output);
end.
