var a,b,i,time,n:byte;
    bridge,group:packed array[1..26]of char;
    cl:packed array['A'..'Z']of boolean;
    goon:packed array[1..26,1..26]of boolean;
Function can(aa,bb:byte):boolean;
         var pa,pb:boolean;
         begin
         can:=false;
         if (aa<n)and(aa>0)and(bb<n)and(bb>0)and(cl[bridge[aa]])and(cl[bridge[bb]]) then
            if goon[aa,bb]=false then
               begin
               pa:=false;
               pb:=false;
               for i:=1 to a do
                   begin
                   if bridge[aa]=group[i] then pa:=true;
                   if bridge[bb]=group[i] then pb:=true;
                   end;
               if (pa=true)and(pb=false) then can:=true else can:=false;
               if can=true then begin
                                cl[bridge[aa]]:=false;
                                cl[bridge[bb]]:=false;
                                end;
               goon[aa,bb]:=true;
               goon[bb,aa]:=true;
               end;
         end;
procedure change(a,b:byte);
          var temp:char;
          begin
          Temp:=bridge[a];
          bridge[a]:=bridge[b];
          bridge[b]:=temp;
          end;
procedure try(dep:byte);
          var i,i2:byte;
          begin
          fillchar(cl,sizeof(cl),true);
          for i:=1 to  26 do
              for i2:=1 to 26 do
                  goon[i,i2]:=false;
          if dep>time then begin
                           rewrite(output);
                           writeln(bridge);
                           close(output);
                           halt;
                           end
                      else begin
                           for i:=1 to n do
                               if can(i,i-1) then change(i,i-1)
                                  else
                               if can(i,i+1) then change(i,i+1);
                           try(dep+1);
                           end;
          end;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
readln(a,b);
n:=a+b;
bridge:='';
for i:=a downto 1 do begin
                     read(bridge[i]);
                     group[i]:=bridge[i];
                     end;
readln;
for i:=a+1 to n do read(bridge[i]);
readln;
readln(time);
close(input);
try(1);
end.