var n,k,t,i,t1,t2:longint;
        p,pp:boolean;
        a1,a2,s:string;
        aa,bb:array[0..9]of longint;
begin
assign(input,'friends.in');
reset(input);
assign(output,'friends.out');
rewrite(output);
readln(n);
for k:=1 to n do
        begin
        fillchar(aa,sizeof(aa),0);
        fillchar(bb,sizeof(bb),0);
        readln(s);
        p:=true;
        t:=pos(' ',s);
        a1:=copy(s,1,t-1);
        a2:=copy(s,t+1,(length(s)-t));
        for i:=1 to length(a1) do
                aa[ord(a1[i])-48]:=1;
        for i:=1 to length(a2) do
                bb[ord(a2[i])-48]:=1;
        for i:=0 to 9 do
                if aa[i]<>bb[i] then p:=false;
        if p then begin writeln('friends');continue;end;
        pp:=true;
        for i:=1 to length(a1)-1 do
                if pp then
                        begin
                        t1:=ord(a1[i])-48;
                        t2:=ord(a1[i+1])-48;
                        if ((bb[t1-1]=1)and(bb[t2+1]=1)) then begin pp:=true;if i=1 then if t1-1=0 then pp:=false;end
                                                         else pp:=false;
                        if not pp then if ((bb[t1+1]=1)and(bb[t2-1]=1)) then pp:=true
                                                                        else pp:=false;
                        end;
        if pp then begin writeln('almost friends');continue; end
                else begin
                     pp:=true;
                     for i:=1 to length(a2)-1 do
                         if pp then
                                        begin
                                        t1:=ord(a2[i])-48;
                                        t2:=ord(a2[i+1])-48;
                                        if (t1>=1)and(t2<=8)then if ((aa[t1-1]=1)and(aa[t2+1]=1)) then begin pp:=true;if i=1 then if t1-1=0 then pp:=false;end
                                                                                                else pp:=false;
                                        if not pp then if (t1<=8)and(t2>=1)then  if ((aa[t1+1]=1)and(aa[t2-1]=1)) then pp:=true
                                                                                                                else pp:=false;
                                        end;
                     if pp then writeln('almost friends')
                           else writeln('nothing');
                     end;
        end;
close(input);
close(output);
end.