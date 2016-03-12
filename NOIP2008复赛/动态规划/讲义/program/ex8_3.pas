program ex8_3(input,output);
const maxm=100; maxn=100;
type arraytype=array [0..maxn] of real;
var i,j,k,m,n,rest:integer;
    q,maxreturn,temp:arraytype;
    invest:array[1..maxm,0..maxn] of integer;
    result:array[1..maxm] of integer;
    fname:string;
    f:text;
begin
     write('Input the name of datafile:');
     readln(fname);
     assign(f,fname);
     reset(f);
     readln(f,m,n);
     for j:=0 to n do read(f,q[j]);
     readln(f);
     for i:=1 to m do
         for j:=0 to n do invest[i,j]:=0;
     maxreturn:=q;
     for j:=0 to n do invest[1,j]:=j;
     for k:=2 to m do
     begin
          temp:=maxreturn;
          for j:=0 to n do invest[k,j]:=0;
          for j:=0 to n do read(f,q[j]);
          readln(f);
          for j:=0 to n do
              for i:=0 to j do
                  if maxreturn[j-i]+q[i]>temp[j] then
                     begin
                          temp[j]:=maxreturn[j-i]+q[i];
                          invest[k,j]:=i
                     end;
          maxreturn:=temp
     end;
     close(f);
     rest:=n;
     for i:=m downto 1 do
     begin
          result[i]:=invest[i,rest];
          rest:=rest-result[i]
     end;
     for i:=1 to m do write(result[i],' ');
     writeln(maxreturn[n]:0:2)
end.

