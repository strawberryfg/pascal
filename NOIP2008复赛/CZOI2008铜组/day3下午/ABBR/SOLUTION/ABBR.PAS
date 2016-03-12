program p_abbr;
const DULJINA = 101;

var ulaz       : string[DULJINA];
    kratica    : string[DULJINA];
    rijec      : string[DULJINA];
    i          : integer;

begin
   assign(input,'abbr.in');
   reset(input);
   assign(output,'abbr.out');
   rewrite(output);
   readln(ulaz);
   ulaz:=ulaz+' ';
   for i:=1 to length(ulaz) do ulaz[i]:=upcase(ulaz[i]);
   kratica := ulaz[1];
   i:=2; while ulaz[i]<>' ' do i:=i+1;
   rijec:='';
   while i<=length(ulaz) do
   begin
      if ulaz[i]<>' ' then
      begin
         rijec:=rijec+ulaz[i];
      end else
      begin
         if (rijec<>'')and
            (rijec<>'I')and
            (rijec<>'PA')and
            (rijec<>'TE')and
            (rijec<>'NI')and
            (rijec<>'NITI')and
            (rijec<>'A')and
            (rijec<>'ALI')and
            (rijec<>'NEGO')and
            (rijec<>'NO')and
            (rijec<>'ILI') then
               kratica:=kratica+rijec[1];
         rijec:='';
      end;
      i:=i+1;
   end;
   writeln(kratica);
   close(input);
   close(output)
end.
