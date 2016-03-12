program sj_phidias;
var
m,n,i,j,k,l : longint;
a,b : array[0..201] of longint;
opt : array[0..601,0..601] of longint;
BEGIN
  assign(input,'phidias.in');reset(input);
  assign(output,'phidias.out');rewrite(output);
  readln(n,m);
  readln(k);
  for i := 1 to k do
    readln(b[i],a[i]);
  fillchar(opt,sizeof(opt),0);
  for i := 1 to m do
    for j := 1 to n do
      begin
        if opt[i,j - 1] + opt[i - 1,1] > opt[i,j] then
          opt[i,j] := opt[i,j - 1] + opt[i - 1,1];
        if opt[i - 1,j] + opt[1,j - 1] > opt[i,j] then
          opt[i,j] := opt[i - 1,j] + opt[1,j - 1];
        for l := 1 to k do
          begin
            if (i - a[l] >= 0) and (j - b[l] >= 0) then
              begin
                if opt[i,j - b[l]] + opt[i - a[l],b[l]] + a[l] * b[l] > opt[i,j] then
                  opt[i,j] := opt[i,j - b[l]] + opt[i - a[l],b[l]] + a[l] * b[l];
                if opt[i - a[l],j] + opt[a[l],j - b[l]] + a[l] * b[l] > opt[i,j] then
                  opt[i,j] := opt[i - a[l],j] + opt[a[l],j - b[l]] + a[l] * b[l];
              end;
          end;
      end;
  writeln(m * n - opt[m,n]);
  close(input);
  close(output);
END.

