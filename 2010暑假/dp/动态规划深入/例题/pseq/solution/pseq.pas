var i,len:longint;
    s:string;
    p:array [1..100,1..100] of longint;
begin
     assign(input,'pseq.in');
     reset(input);
     readln(s);
     close(input);
     for i:=1 to length(s) do p[i,i]:=1;
     for i:=1 to length(s)-1 do
         if s[i]=s[i+1]
            then p[i,i+1]:=2
            else p[i,i+1]:=1;
     for len:=3 to length(s) do
         for i:=1 to length(s)-len+1 do
             if s[i]=s[i+len-1]
                then p[i,i+len-1]:=p[i+1,i+len-2]+2
                else if p[i,i+len-2]>p[i+1,i+len-1]
                        then p[i,i+len-1]:=p[i,i+len-2]
                        else p[i,i+len-1]:=p[i+1,i+len-1];
     assign(output,'pseq.out');
     rewrite(output);
     writeln(p[1,length(s)]);
     close(output)
end.
