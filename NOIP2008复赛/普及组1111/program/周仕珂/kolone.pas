var d1,d2,i,j,t,t1,p:longint;
        s1,s2,s3,temp:string;
        fx,pd:array[0..10000000]of longint;
procedure swap(var char1,char2:char);
var t:char;
begin
t:=char1;
char1:=char2;
char2:=t;
end;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(d1,d2);
readln(s1);
readln(s2);
read(t);
for i:=d1 downto 1 do
        temp:=temp+s1[i];
s3:=temp+s2;
for i:=1 to d1+d2 do
        if i<=d1 then fx[i]:=1
                else fx[i]:=2;
for i:=1 to t do
begin
        for j:=1 to d1+d2 do
                begin
            if (fx[j]=1)and(fx[j+1]=2) then begin if (pd[j]=1)or(pd[j+1]=1) then continue;
                                                  swap(s3[j],s3[j+1]);
                                                  t1:=fx[j];fx[j]:=fx[j+1];fx[j+1]:=t1;
                                                  inc(pd[j]);inc(pd[j+1]);
                                                        end

            else if (fx[j]=2)and(fx[j-1]=1) then begin
                                                if (pd[j]=1)or(pd[j-1]=1) then continue;
                                                 swap(s3[j],s3[j-1]);
                                                  t1:=fx[j];fx[j]:=fx[j-1];fx[j-1]:=t1;
                                                  inc(pd[j]);inc(pd[j-1]);
                                                        end;
            end;
        fillchar(pd,sizeof(pd),0);
end;
writeln(s3);
close(input);
close(output);
end.
