Var x,y,fx,fy,Ans,Max,i,j,m,n,row,lin,p1,p2,p3,p4,top:longint;
    Rank,F:array[0..200000] of Longint;
    H:array[0..20000] of Boolean;
    G:array[0..200000] of Record fm,en:longint; End;
    ch:char;
Function Get(x:longint):longint;
Begin
  If F[x]=x
  then Get:=x
  else Begin
         F[x]:=Get(F[x]);
         Get:=F[x];
       End;
End;

Begin
Assign(input,'floor.in');
Reset(input);
Assign(output,'floor.out');
Rewrite(output);

  Readln(n,m);
  top:=0;
  For i:=1 to n do
  Begin row:=i*2;
        For j:=1 to m do
        Begin Read(ch);
              lin:=j*2;
              p1:=(row-2)*(2*m+1)+Lin;
              p2:=(row)  *(2*m+1)+Lin;
              p3:=(Row-1)*(2*m+1)+Lin-1;
              p4:=(Row-1)*(2*m+1)+Lin+1;
              Case ch of
              'A':Begin
                    Inc(top);
                    G[top].fm:=p1; G[top].en:=p3;
                    Inc(top);
                    G[top].fm:=p2; G[top].en:=p4;
                  End;
              'B':Begin
                    Inc(top);
                    G[top].fm:=p1; G[top].en:=p4;
                    Inc(top);
                    G[top].fm:=p2; G[top].en:=p3;
                  End;
              End;
        End;  readln;
  End;
  For i:=1 to (2*n+1)*(2*m+1) do
  Begin F[i]:=i;
        Rank[i]:=0;
  End;
  For i:=1 to top do
  Begin x:=G[i].fm; y:=G[i].en;
        fx:=Get(x); fy:=Get(y);
        If fx<>fy
        then Begin Rank[fy]:=Rank[fy]+Rank[fx]+1;
                   Rank[fx]:=0; F[fx]:=fy;
             End
        else Begin Rank[fy]:=Rank[fy]+1;
             End;

  End;

  Fillchar(H,sizeof(H),false); Ans:=0; Max:=0;
  For i:=1 to (2*n+1)*(2*m+1) do
  Begin F[i]:=Get(i);
        If Rank[F[i]]>Max then Max:=Rank[F[i]];
        If (Rank[F[i]]<>0) and (H[F[i]]=false)
        then Begin Inc(Ans);
                   H[F[i]]:=true;
             End;
  End;
  Writeln(Ans,' ',Max);

Close(input);
Close(output);
End.
