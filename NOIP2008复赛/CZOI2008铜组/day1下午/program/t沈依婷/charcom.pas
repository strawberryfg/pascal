var n,i,j:longint;a,b:string;c:array[1..26]of char;
procedure try(dep:longint);
var i,k:longint;
begin
if b=a then begin writeln(dep);halt;end
          else for i:=1 to n do
          begin
                b:=b+c[i];
                for j:=1 to length(b)-1 do
                if b[j]<b[j+1]then try(dep+1);
          end;
end;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
c[1]:='A';c[2]:='B';c[3]:='C';c[4]:='D';c[5]:='E';c[6]:='F'; c[7]:='G';
c[8]:='H';c[9]:='I';c[10]:='J';
c[11]:='K';c[12]:='L';c[13]:='M';c[14]:='N';c[15]:='O';c[16]:='P'; c[17]:='Q';
c[18]:='R';c[19]:='S';c[20]:='T';
c[21]:='U';c[22]:='V';c[23]:='W';c[24]:='X';c[25]:='Y';c[26]:='Z';
readln(n);
readln(a);
try(1);
close(input);
close(output);
end.
