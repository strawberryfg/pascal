program rhyme;
const maxn = 4000;
var   a,f,p: array [0..maxn] of longint;
      maxb,i,j,k,n,max,last: longint;
      ok: boolean;
begin
      assign (input,'rhyme.in');
      reset (input);
      readln (n);
      for i := 1 to n do read (a[i]);

      for i := 1 to n do
      begin
            k := 0;
            for j := i-1 downto 1 do
                  if a[j] = a[i] then
                  begin
                         k := j;  break;
                  end;
            p[i] := k;
      end;

      f[0] := 0;
      for i := 1 to n do
      begin
            max := f[i-1];  { AABB }
            for j := p[i]-1 downto 1 do
                  if (p[j] > 0) and (a[j] <> a[i]) then
                        begin
                        if max < f[p[j]-1]+1 then
                            begin
                            max := f[p[j]-1]+1;
                            break;
                            end;
                        end;
            k := i; last := i; { ABAB }
            while k <> 0 do
            begin
                  k := p[k];
                  if k = 0 then break;
                  for j := k+1 to last-1 do
                        if (p[j] > 0) and (p[j] < k) and (a[j] <> a[i]) then
                              if max < f[p[j]-1]+1 then
                                 begin
                                 max := f[p[j]-1]+1;
                                 break;
                                 end;
                  last := k;
            end;

            k := i; last := i; maxb := -1;{ ABBA }
            while k <> 0 do
            begin
                  k := p[k];
                  if k = 0 then break;
                  for j := k+1 to last-1 do
                  if a[j] <> a[i] then
                  begin
                        if maxb < p[j] then maxb := p[j];
                        if (maxb > k) and (a[j] <> a[i]) then
                        begin
                              if max < f[k-1]+1 then max := f[k-1]+1;
                              k := 0; break;
                        end;
                  end;
                  last := k;
            end;

            k := i;    ok := true; { AAAA }
            for j := 1 to 3 do
            begin
                   k := p[k];
                   if k = 0 then
                   begin
                        ok := false; break;
                   end;
            end;
            if ok then
                  if max < f[k-1]+1 then max := f[k-1]+1;

            f[i] := max;
      end;

      assign (output,'rhyme.out');
      rewrite (output);
 //     for i := 1 to n do write (f[i],' '); writeln;
      writeln (f[n]);
      close (output);

end.
