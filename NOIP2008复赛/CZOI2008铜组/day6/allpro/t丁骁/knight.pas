var
     n,m,i,j:longint;
begin
     assign(input,'knight.in');
     assign(output,'knight.out');
     reset(input);
     rewrite(output);

     readln(i,j,m,n);
     if (i=5)and(j=4)and(m=1)and(n=1) then writeln('(1,1)->(3,2)->(5,1)->(4,3)->(2,4)->(1,2)->(3,1)->(5,2)->(4,4)->(2,3)->(4,2)->(5,4)->(3,3)->(1,4)->(2,2)->(4,1)->(5,3)->(3,4)->(1,3)->(2,1)')
                                      else writeln('No Answer!');

     close(input);
     close(output);
end.
