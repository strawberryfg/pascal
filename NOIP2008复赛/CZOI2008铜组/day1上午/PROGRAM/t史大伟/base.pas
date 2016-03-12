var  l,r,lx,rx,i,j,total:longint;
    str:string;
    f,p,fs:boolean;
procedure try(k,kx:longint);
var a:array[1..32] of longint;
    i,j:longint;
begin
str:='';
i:=1;
while k div kx>0 do
begin
a[i]:=k mod kx;
k:=k div kx;
i:=i+1;
end;
a[i]:=k;
for j:=i downto 1 do
begin
   case a[j] of
   0: str:=str+'0';
   1: str:=str+'1' ;
   2: str:=str+'2';
   3: str:=str+'3'                             ;
   4: str:=str+'4'                              ;
   5: str:=str+'5'                            ;
   6: str:=str+'6'                           ;
   7: str:=str+'7'                          ;
   8: str:=str+ '8'                        ;
   9: str:=str+ '9'                       ;
   10:str:=str+ 'a'                      ;
   11:str:=str+ 'b'                     ;
   12:str:=str+  'c'                   ;
   13:str:=str+  'd'                   ;
   14:str:=str+  'e'                  ;
   15:str:=str+  'f'                  ;
   16:str:=str+  'g'                  ;
   17:str:=str+  'h'                 ;
   18:str:=str+   'i'               ;
   19:str:=str+   'j'              ;
   20:str:=str+   'k'             ;
   21:str:=str+   'l'            ;
   22:str:=str+   'm'           ;
   23:str:=str+   'n'             ;
   24:str:=str+   'o'          ;
   25:str:=str+   'p'         ;
   26:str:=str+   'q'        ;
   27:str:=str+   'r'       ;
   28:str:=str+   's'      ;
   29:str:=str+   't'     ;
   30:str:=str+   'u'    ;
   31:str:=str+   'v'   ;
   32:str:=str+   'w'  ;
   33:str:=str+  'x'  ;
   34:str:=str+  'y' ;
   35:str:=str+  'z';
   end;
end;
end;
function fun(k,kx:longint):boolean;
var le,ri:shortint;
begin
fun:=true;
try(k,kx);
le:=1;
ri:=length(str);
while (le<=ri) do
begin
if str[le]<>str[ri] then begin fun:=false;break;end;
inc(le);
dec(ri);
end;
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
fs:=true;
read(l,r,lx,rx);
for i:=l to r do
begin
if sqrt(i)  =trunc(sqrt(i)) then
             begin
             f:=false;
             p:=false;
             for j:=lx to rx do
                 begin
                 fs:=fun(i,j);
                  if (f=true)and(fs=true) then begin p:=true;break;end;
                 if fs=true then f:=fs;
                 end;
                 if (p=false)and(f=true) then begin inc(total);end;
             end;
end;
write(total);
close(input);
close(output);
end.
