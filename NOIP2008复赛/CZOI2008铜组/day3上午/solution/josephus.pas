program program1;
var i,k,m,start:longint;
    find:boolean;
function check(remain:integer):boolean;
var result:integer;
begin
     result:=(start+m-1) mod remain;
     if result>=k
        then begin
             start:=result;
             check:=true
             end
        else check:=false
end;
begin
     assign(input,'josephus.in');
     reset(input);
     read(k);
     close(input);
     find:=false;
     m:=k;
     while not(find) do
     begin
          find:=true;
          start:=0;
          for i:=0 to k-1 do
              if not check(2*k-i) then
                 begin
                      find:=false;
                      break
                 end;
          inc(m)
     end;
     assign(output,'josephus.out');
     rewrite(output);
     writeln(m-1);
     close(output)
end.
