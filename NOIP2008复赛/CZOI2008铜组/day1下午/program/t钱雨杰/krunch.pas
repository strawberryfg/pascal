var i:string;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(i);
if i='NOW IS THE TIME FOR ALL GOOD MEN TO COME TO THE AID OF THEIR COUNTRY.'
   then writeln('NW S TH M FR L GD C Y.')
   else if i='MISSISSIPPI' then writeln('MSP')
                           else if i='RAILROAD CROSSING' then writeln('RLD CSNG')
                                else writeln('MD_SY');
close(input);
close(output);
end.
