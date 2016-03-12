var i,j,sum:longint;
        a:array[1..9,1..9]of longint;

procedure print;
  var i,j:longint;
  begin
  for i:=1 to 9 do
        begin
        for j:=1 to 8 do
                write(a[i,j],' ');
        write(a[i,9]);
        writeln;
        end;
  close(input);
  close(output);
  halt;
  end;

function pd(i,j,p,dep:longint):boolean;
  var k,q,n,m:longint;
  begin
  pd:=true;
  if a[i,j]<>0 then begin pd:=false;
                          exit
                    end;
  for k:=1 to 9 do
        if a[i,k]=p then begin pd:=false;exit; end;
  for k:=1 to 9 do
        if a[k,j]=p then begin pd:=false;exit; end;
  n:=(i+2)div 3;
  m:=(j+2)div 3;
  for k:=(n-1)*3+1 to n*3 do
        for q:=(m-1)*3+1 to m*3 do
                if a[k,q]=p then begin pd:=false;exit; end;
  end;

procedure try(dep,i,j:longint);
  var k:longint;
  begin
  if dep>sum then print
             else begin
                  for k:=1 to 9 do
                      begin
                      if pd(i,j,k,dep) then
                      begin
                      a[i,j]:=k;
                      if j<9 then inc(j)
                              else begin inc(i);j:=1; end;
                      try(dep+1,i,j);
                      end
                      else  if a[i,j]<>0 then begin
                                              if j<9 then inc(j)
                                                else begin inc(i);j:=1; end;
                                                try(dep+1,i,j);
                                              end;

                      end;
                  end;
  end;

begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
sum:=0;
for i:=1 to 9 do
        begin
        for j:=1 to 9 do
                begin
                read(a[i,j]);
                if a[i,j]=0 then inc(sum);
                end;
        readln;
        end;
try(1,1,1);
close(input);
close(output);
end.
