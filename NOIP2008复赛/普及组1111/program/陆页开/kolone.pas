var n1,n2,i,t,j:longint;
    s1,s2:string;
    ss1:array[1..10000] of char;
    h,h2:array[1..10000] of boolean;
    k:char;
    b:boolean;
procedure setup;
  begin
  assign(input,'kolone.in');
  reset(input);
  assign(output,'kolone.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n1,n2);
readln(s1);
readln(s2);
readln(t);
for i:=1 to n1 do
    ss1[i]:=s1[n1-i+1];
for i:=n1+1 to n2+n1 do
    ss1[i]:=s2[i-n1];
if t=0 then begin
            for i:=1 to n1 do
                begin
                write(ss1[i]);
                writeln(s2);
                endit;
                halt;
                end;
            end;
for i:=1 to n1 do
    begin h2[i]:=true;h[i]:=true;end;
for i:=n1+1 to (n1+n2) do
    begin h2[i]:=true;h[i]:=false;end;
for i:=1 to t do
    begin
    for j:=1 to n1+n2 do
        h2[j]:=true;
    for j:=1 to (n1+n2) do
        begin
        if h2[j]=true then
          if (h[j]=true) and (h[j+1]=false) then begin
                                                 k:=ss1[j];
                                                 ss1[j]:=ss1[j+1];
                                                 ss1[j+1]:=k;
                                                 b:=h[j];
                                                 h[j]:=h[j+1];
                                                 h[j+1]:=b;
                                                 h2[j+1]:=false;
                                                 end;
        end;
    end;
for i:=1 to n1+n2 do
    write(ss1[i]);
writeln;
endit;
end.
