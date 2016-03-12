program base;
var n1,n2,r1,r2,num,sum:int64;
    i,j:longint;
    t:boolean;
    a:array[1..32]of longint;
function huiwen:boolean;
var half,k:longint;
begin
if num=1 then exit(false) else
if num div 2=1 then begin
                         half:=num div 2+1;
                         for k:=1 to half-1 do
                                begin
                                     if a[k]=a[num-k+1] then continue;
                                     exit(false);
                                end;
                         exit(true);
                    end
               else begin
                         half:=num div 2;
                         for k:=0 to half-1 do
                                begin
                                     if a[half-k]=a[half+k+1] then continue;
                                     exit(false);
                                end;
                         exit(true);
                    end;

end;
procedure change(x,y:longint);
var s:int64;
    k:longint;
begin
     fillchar(a,sizeof(a),0);
     s:=sqr(x);
     num:=0;
     while s>0 do
     begin
          num:=num+1;
          a[num]:=s mod y;
          s:=s div y;
     end;
end;
begin
     assign(input,'base.in');reset(input);
     assign(output,'base.out');rewrite(output);
     read(n1,n2,r1,r2);
     for i:=trunc(sqrt(n1)) to trunc(sqrt(n2)) do
            begin
                 t:=false;
                 for j:= r1 to r2 do
                        begin
                             change(i,j);
                             if not(t) then
                             if huiwen then t:=true
                                                    else t:=false
                                  else if huiwen then begin
                                                                  t:=false;
                                                                  end
                        end;
                 if t then sum:=sum+1;
            end;
            writeln(sum);
     close(input);
     close(output);
end.