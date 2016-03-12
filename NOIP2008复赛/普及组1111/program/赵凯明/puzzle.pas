type arr=array[1..9,1..9] of integer;

const map:array[1..9,1..9] of integer=((1,1,1,2,2,2,3,3,3),
                                       (1,1,1,2,2,2,3,3,3),
                                       (1,1,1,2,2,2,3,3,3),
                                       (4,4,4,5,5,5,6,6,6),
                                       (4,4,4,5,5,5,6,6,6),
                                       (4,4,4,5,5,5,6,6,6),
                                       (7,7,7,8,8,8,9,9,9),
                                       (7,7,7,8,8,8,9,9,9),
                                       (7,7,7,8,8,8,9,9,9));


var i,j:longint;
    a,a1:arr;

function pd(di,dj,k:longint):boolean;
         var i,j:longint;
         begin
           pd:=true;
           for i:=1 to 9 do
               for j:=1 to 9 do
                   if (map[i,j]=map[di,dj]) and (a[i,j]=k) then
                      begin
                       pd:=false;
                       exit;
                      end;
          for i:=1 to 9 do
               if a[i,dj]=k then
                  begin
                    pd:=false;
                    exit;
                  end;
           for j:=1 to 9 do
               if a[di,j]=k then
                  begin
                    pd:=false;
                    exit;
                  end;
         end;

procedure print;
          var i,j:longint;
          begin
            for i:=1 to 9 do
                begin
                  for j:=1 to 8 do
                      write(a[i,j],' ');
                      writeln(a[i,9]);
                end;
          end;

procedure remove(k:longint);
          var i,j:longint;
          begin
            if k mod 9=0 then i:=k div 9
            else i:=k div 9+1;
            j:=k mod 9;
            if j=0 then j:=9;
            a[i,j]:=0;
          end;

procedure search(dep:longint);
          var i,dep1,dep2:longint;
          begin
            if dep>81 then print
                    else begin
                         if dep mod 9=0 then
                            dep1:=dep div 9
                            else dep1:=dep div 9+1;
                         dep2:=dep mod 9;
                         if dep2=0 then dep2:=9;
                        if a[dep1,dep2]=0 then
                          begin
                            for i:=1 to 9 do
                                begin
                                  if pd(dep1,dep2,i) then
                                     begin
                                       a[dep1,dep2]:=i;
                                       search(dep+1);
                                       remove(dep);
                                     end;
                                 end;
                          end else search(dep+1);
                         end;
          end;

begin
assign(input,'puzzle.in');reset(input);
assign(output,'puzzle.out');rewrite(output);
  for i:=1 to 9 do
      for j:=1 to 9 do
          read(a[i,j]);
a1:=a;
search(1);
close(input);close(output);
end.
