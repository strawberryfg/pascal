program KOLONEczt;

var i,j,m,n,t:longint;
    temp,ch:char;
    ok:array['A'..'Z'] of boolean;
    change,sq:array[1..10000] of char;

begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);

  readln(n,m);
  for i:=1 to n do
      begin
        read(ch);
	sq[n-i+1]:=ch;
	ok[ch]:=false;
      end;
  readln;
  for i:=1 to m do
      begin
	read(ch);
        sq[i+n]:=ch;
	ok[ch]:=true;
      end;
  readln(t);
  for j:=1 to n+m do
      begin
	change[j]:=sq[j];
      end;
  for i:=1 to t do
      begin
        for j:=1 to n+m-1 do
            begin
		if (ok[sq[j]]=false) and (ok[sq[j+1]]) then
 		   begin
			temp:=change[j];
 			change[j]:=change[j+1];
			change[j+1]:=temp;
		   end;
	    end;
        for j:=1 to n+m do
            begin
	      sq[j]:=change[j];
	    end;
      end;
  for i:=1 to n+m do
      write(sq[i]);

close(input);
close(output);
end.
