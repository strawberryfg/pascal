{
JSTSC Round 1
Problem 3
Author: Koala
}

program problem_c;

const
  maxn=250;

var
  c:array [0..maxn,0..maxn] of longint;
  a,b:string;
  ppp,pp,i,j,m,n:longint;

begin
  assign(input,'input3.dat');
  reset(input);
  readln(ppp);
  for pp:=1 to ppp do
  begin
    readln(a); m:=length(a);
    readln(b); n:=length(b);
    for i:=0 to m do
      for j:=0 to n do
        if (i=0) and (j=0)
          then c[i,j]:=0
          else
            if (i>0) and (j>0) and (a[i]=b[j])
              then c[i,j]:=c[i-1,j-1]
              else begin
                c[i,j]:=maxlongint;
                if (j>0) and (c[i,j-1]+1<c[i,j]) then c[i,j]:=c[i,j-1]+1;
                if (i>0) and (c[i-1,j]+1<c[i,j]) then c[i,j]:=c[i-1,j]+1;
                if (i>0) and (j>0) and (c[i-1,j-1]+1<c[i,j]) then c[i,j]:=c[i-1,j-1]+1;
              end;
    writeln(c[m,n]);
  end;
  close(input);
end.
