program Pair;
const
  filein='pair.in';
  fileout='pair.out';
var
  n,i,x,Min,Max,temp,Min2:Longint;
  hash:array[0..200000] of longint;
  Num:array[1..9] of longint;
procedure work(x:Longint);
var
  i,j,small:Longint;
  f:boolean;
begin
  if x=N+1 then
  begin
      for i:=1 to N do
      write(Num[i],' ');
      close(input);
      close(output);
      halt;
  end else
  if x=1 then
  begin
      for i:=0 to Min div 2 do
      begin
          Num[1]:=i;
          work(2);
      end;
  end else
  if x=2 then
  begin
      Num[2]:=Min-Num[1];
      Dec(Hash[min]);
      work(3);
      Inc(hash[min]);
  end else
  if x=3 then
  begin
      NUm[3]:=Min2-Num[1];
      if Num[3]>=Num[2] then
      begin
          Dec(hash[min2]);
          Dec(hash[NUm[2]+Num[3]]);
          if (hash[Min2]>=0) and (hash[num[2]+num[3]]>=0) then
          work(4);
          Inc(hash[min2]);
          Inc(hash[Num[2]+Num[3]]);
      end;
  end else
  begin
      small:=max-num[x-1];
      for i:=NUm[x-1] to Small do
      begin
          f:=true;
          Num[x]:=i;
          for j:=1 to x-1 do
          begin
            dec(Hash[i+Num[j]]);
            if hash[i+Num[j]]<0 then f:=false;
          end;
          if f then work(x+1);
          for j:=1 to x-1 do Inc(Hash[i+Num[j]]);
      end;
  end;
end;
begin
  fillchar(Hash,sizeof(hash),0);
  assign(input,filein);
  Assign(output,fileout);
  rewrite(output);
  reset(input);
  Read(N);
  Min:=MaxLongint;
  Max:=0;
  temp:=0;
  for i:=1 to n*(n-1) div 2 do
  begin
      Read(x);
      if x<min then min:=x;
      if x>temp then temp:=x;
      Inc(hash[x]);
  end;
  if Hash[Min]>1 then Min2:=Min else
  begin
      Min2:=min+1;
      while Hash[min2]=0 do inc(min2);
  end;
  if temp>max then max:=temp;
  work(1);
  writeln('Impossible');
  close(input);
  close(output);
end.
