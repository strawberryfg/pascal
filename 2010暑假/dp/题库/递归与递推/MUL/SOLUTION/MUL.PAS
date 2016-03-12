Program Mul;
 Const
      Inf           = 'Mul.in';
      Ouf           = 'Mul.out';
      MaxN          = 6000;
 Type
     TLine          = Array [1..MaxN] Of Integer;
 Var
    x,y,m,n,o,p     : Integer;
    Ax,ABx          : TLine;
    Cxy             : Integer;
  Procedure Init_Doit_Print;
   Var
      Fin,Fou       : Text;
      i,j,a         : Integer;
      Str1          : String;
   Begin
        Assign(Fin,Inf);
        Reset(Fin);

        Readln(Fin,x,y);
        Readln(Fin,m,n,o,p);

        Fillchar(Ax,Sizeof(Ax),0);
        Readln(Fin,Str1);
        While Str1<>'' Do
              Begin
                   Val(Copy(Str1,1,Pos(' ',Str1)-1),i,i);
                   Delete(Str1,1,Pos(' ',Str1));
                   Val(Copy(Str1,1,Pos(' ',Str1)-1),j,j);
                   Delete(Str1,1,Pos(' ',Str1));
                   Val(Str1,a,a);
                   If i=x Then Ax[j]:=a;
                   Readln(Fin,Str1);
              End;
        Readln(Fin,Str1);
        Fillchar(ABx,Sizeof(ABx),0);
        While Str1<>'' Do
              Begin
                   Val(Copy(Str1,1,Pos(' ',Str1)-1),i,i);
                   Delete(Str1,1,Pos(' ',Str1));
                   Val(Copy(Str1,1,Pos(' ',Str1)-1),j,j);
                   Delete(Str1,1,Pos(' ',Str1));
                   Val(Str1,a,a);
                   Inc(ABx[j],a*Ax[i]);
                   Readln(Fin,Str1);
              End;

        Readln(Fin,Str1);
        Cxy:=0;
        While Str1<>'' Do
              Begin
                   Val(Copy(Str1,1,Pos(' ',Str1)-1),i,i);
                   Delete(Str1,1,Pos(' ',Str1));
                   Val(Copy(Str1,1,Pos(' ',Str1)-1),j,j);
                   Delete(Str1,1,Pos(' ',Str1));
                   Val(Str1,a,a);
                   If j=y Then Inc(Cxy,ABx[i]*a);
                   Readln(Fin,Str1);
              End;
        Close(Fin);

        Assign(Fou,Ouf);
        Rewrite(Fou);

        Writeln(Fou,Cxy);

        Close(Fou);
   End;
 Begin
      Init_Doit_Print;
 End.