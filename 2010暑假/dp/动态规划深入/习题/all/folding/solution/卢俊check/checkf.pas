program checkf(input,output);

const
  inf='folding.in';
  outf='folding.out';
  ansf='folding.ans';
  resf='check.txt';

var
  ifile,ofile,afile,rfile:text;
  istr,ostr,astr:string;

function strtoint(st:string):longint;
var
  i,n:longint;
begin
  n:=0;
  for i:=1 to length(st) do
    n:=n*10+ord(st[i])-48;
  strtoint:=n;
end;

function open(st:string):string;
var
  stt,nt,sttt:string;
  i,t,time,l,r:longint;
begin
  stt:='';
  while st<>'' do
    begin
      if st[1] in ['A'..'Z'] then
        begin
          stt:=stt+st[1];
          delete(st,1,1);
          continue;
        end;
      t:=pos('(',st);
      nt:=copy(st,1,t-1);
      time:=strtoint(nt);
      delete(st,1,t);
      l:=1;
      r:=0;
      for t:=1 to length(st) do
        begin
          if st[t]='(' then inc(l);
          if st[t]=')' then inc(r);
          if l=r then break;
        end;
      sttt:=open(copy(st,1,t-1));
      delete(st,1,t);
      for i:=1 to time do stt:=stt+sttt;
    end;
  open:=stt;
end;

begin
  assign(rfile,resf);
  rewrite(rfile);
  writeln(rfile,'Error!');
  close(rfile);
  assign(ifile,inf);
  assign(ofile,outf);
  assign(afile,ansf);
  reset(ifile);
  reset(ofile);
  reset(afile);
  readln(ifile,istr);
  readln(ofile,ostr);
  readln(afile,astr);
  if length(ostr)<>length(astr) then exit;
  ostr:=open(ostr);
  if ostr<>istr then exit;
  close(ifile);
  close(ofile);
  close(afile);
  assign(rfile,resf);
  rewrite(rfile);
  writeln(rfile,'FC:Right!');
  close(rfile);
end.
