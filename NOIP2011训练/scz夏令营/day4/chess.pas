const maxn=1040;
var a:array[1..maxn,1..maxn]of char;
    rb,rw,cb,cw:array[0..maxn,0..maxn]of longint;
    fb,fw,gb,gw:array[0..maxn]of longint;
    n,m,i,j,white,black,sumx,sumo,lx,lo:longint;
    x,o,pd:boolean;
begin
assign(input,'chess.in');
reset(input);
assign(output,'chess.out');
rewrite(output);
readln(n,m);
pd:=true;
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(a[i,j]);
        if a[i,j]='X' then
           begin
           inc(black);
           rb[i,j]:=rb[i,j-1]+1;
           cb[i,j]:=cb[i-1,j]+1;
           if i=j then
              begin
              fb[i]:=fb[i-1]+1;
              gb[i]:=gb[i-1]+1;
              end;
           end
        else if a[i,j]='O' then
                begin
                inc(white);
                rw[i,j]:=rw[i,j-1]+1;
                cw[i,j]:=cw[i-1,j]+1;
                if i=j then
                   begin
                   fw[i]:=fw[i-1]+1;
                   gw[i]:=gw[i-1]+1;
                   end;
                end
             else if a[i,j]='.' then pd:=false;
        end;
    readln;
    end;
if not((black=white)or(black-white=1)) then writeln('ERROR')
   else begin
        x:=false; o:=false;
        lx:=0; lo:=0;
        for i:=1 to n+1-m do
            begin
            if fb[i+m-1]-fb[i-1]=m then
               begin
               x:=true;
               if lx<>2 then inc(sumx);
               lx:=1;
               end;
            if fw[i+m-1]-fw[i-1]=m then
               begin
               o:=true;
               if lo<>2 then inc(sumo);
               lo:=1;
               end;
            if gb[i+m-1]-gb[i-1]=m then
               begin
               x:=true;
               if lx<>1 then inc(sumx);
               lx:=2;
               end;
            if gw[i+m-1]-gw[i-1]=m then
               begin
               o:=true;
               if lo<>1 then inc(sumo);
               lo:=2;
               end;
            end;
        lx:=0; lo:=0;
        for i:=1 to n do
            begin
            for j:=1 to n+1-m do
                begin
                if rb[i,j+m-1]-rb[i,j-1]=m then
                   begin
                   x:=true;
                   if lx<>i then inc(sumx);
                   lx:=i;
                   end;
                if rw[i,j+m-1]-rw[i,j-1]=m then
                   begin
                   o:=true;
                   if (lo<>i) then inc(sumo);
                   end;
                end;
            end;
        lx:=0; lo:=0;
        for i:=1 to n+1-m do
            begin
            for j:=1 to n do
                begin
                if cb[i+m-1,j]-cb[i-1,j]=m then
                   begin
                   x:=true;
                   if (lx<>j) then inc(sumx);
                   lx:=j;
                   end;
                if cw[i+m-1,j]-cw[i-1,j]=m then
                   begin
                   o:=true;
                   if (lo<>j) then inc(sumo);
                   lo:=j;
                   end;
                end;
            end;
        if (x)and(o) then writeln('ERROR')
           else if x then
                   begin
                   if (black-white<>1){or(sumx>1)} then writeln('ERROR')
                      else writeln('X WINS');
                   end
                else if o then
                        begin
                        {if (sumo>1) then writeln('ERROR')
                           else} writeln('O WINS');
                        end
                     else begin
                          if not pd then writeln('IN PROGRESS')
                             else writeln('DRAW');
                          end;
        end;
close(input);
close(output);
end.
