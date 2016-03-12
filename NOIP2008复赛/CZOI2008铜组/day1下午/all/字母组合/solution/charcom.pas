var f:array['A'..'Z'] of longint;
    n,i,ans:longint;
    s:string;
    ch,last:char;
begin
     assign(input,'charcom.in');
     reset(input);
     assign(output,'charcom.out');
     rewrite(output);
     readln(n);
     readln(s);
     f[chr(n+64)]:=1;
     for ch:=chr(n+63) downto 'A' do f[ch]:=f[succ(ch)]*2;
     ans:=0;
     last:=pred('A');
     for i:=1 to length(s) do
     begin
          for ch:=succ(last) to pred(s[i]) do
              ans:=ans+f[ch];
          ans:=ans+1;
          last:=s[i];
     end;
     writeln(ans);
     close(input);
     close(output);
end.
