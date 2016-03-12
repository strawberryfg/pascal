var n,i,j,q,k1,k2:longint;
    f:boolean;
    s:char;
    a,b:array[1..101]of longint;
    hash1,hash2:array[0..10]of boolean;
begin
assign(input,'friends.in');
reset(input);
assign(output,'friends.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(s);
    a[1]:=ord(s)-48;
    k1:=1;
    while a[k1]>=0 do
          begin
          inc(k1);
          read(s);
          a[k1]:=ord(s)-48;
          end;
    dec(k1);
    read(s);
    b[1]:=ord(s)-48;
    k2:=1;
    while ord(b[k2])>=0 do
          begin
          inc(k2);
          read(s);
          b[k2]:=ord(s)-48;
          end;
    dec(k2);
    readln;
    fillchar(hash1,sizeof(hash1),false);
    fillchar(hash2,sizeof(hash2),false);
    for j:=1 to k1 do
        hash1[ord(a[j])]:=true;
    for j:=1 to k2 do
        hash2[ord(b[j])]:=true;
    f:=true;
    for j:=0 to 9 do
        if hash1[j]<>hash2[j] then f:=false;
    if f=true then writeln('friends')
              else begin
                   for j:=1 to k1-1 do
                       begin
                       dec(a[j]);
                       inc(a[j+1]);
                       if ((j=1)and(a[1]=0))or(a[j]=-1)or(a[j+1]=10) then begin
                                                                          inc(a[j]);
                                                                          dec(a[j+1]);
                                                                          end
                                                                     else begin
                                                                          fillchar(hash1,sizeof(hash1),false);
                                                                          fillchar(hash2,sizeof(hash2),false);
                                                                          for q:=1 to k1 do
                                                                              hash1[ord(a[q])]:=true;
                                                                          for q:=1 to k2 do
                                                                              hash2[ord(b[q])]:=true;
                                                                          f:=true;
                                                                          for q:=0 to 9 do
                                                                              if hash1[q]<>hash2[q] then begin
                                                                                                         f:=false;
                                                                                                         break;
                                                                                                         end;
                                                                          if f=true then begin
                                                                                          writeln('almost friends');
											  break;
										          end
                                                                                     else begin
                                                                                          inc(a[j]);
                                                                                          dec(a[j+1]);
                                                                                          end;
                                                                          end;
                       end;
                   if f=false then
                   for j:=1 to k1-1 do
                       begin
                       inc(a[j]);
                       dec(a[j+1]);
                       if (a[j+1]=-1)or(a[j]=10) then begin
                                                      dec(a[j]);
                                                      inc(a[j+1]);
                                                      end
                                                 else begin
                                                      fillchar(hash1,sizeof(hash1),false);
                                                      fillchar(hash2,sizeof(hash2),false);
                                                      for q:=1 to k1 do
                                                          hash1[ord(a[q])]:=true;
                                                      for q:=1 to k2 do
                                                          hash2[ord(b[q])]:=true;
                                                      f:=true;
                                                      for q:=0 to 9 do
                                                          if hash1[q]<>hash2[q] then begin
                                                                                     f:=false;
                                                                                     break;
                                                                                     end;
                                                      if f=true then begin
 								     writeln('almost friends');
								     break;
								     end
                                                                 else begin
                                                                      dec(a[j]);
                                                                      inc(a[j+1]);
                                                                      end;
                                                      end
                       end;
		   if f=false then
                   for j:=1 to k2-1 do
                       begin
                       dec(b[j]);
                       inc(b[j+1]);
                       if ((j=1)and(b[1]=0))or(b[j]=-1)or(b[j+1]=10) then begin
                                                                          inc(b[j]);
                                                                          dec(b[j+1]);
                                                                          end
                                                                     else begin
                                                                          fillchar(hash1,sizeof(hash1),false);
                                                                          fillchar(hash2,sizeof(hash2),false);
                                                                          for q:=1 to k1 do
                                                                              hash1[ord(a[q])]:=true;
                                                                          for q:=1 to k2 do
                                                                              hash2[ord(b[q])]:=true;
                                                                          f:=true;
                                                                          for q:=0 to 9 do
                                                                              if hash1[q]<>hash2[q] then begin
                                                                                                         f:=false;
                                                                                                         break;
                                                                                                         end;
                                                                          if f=true then begin
 											  writeln('almost friends');
											  break;
											  end
                                                                                     else begin
                                                                                          inc(b[j]);
                                                                                          dec(b[j+1]);
                                                                                          end;
                                                                          end;
                       end;
		   if f=false then
                   for j:=1 to k2-1 do
                       begin
                       inc(b[j]);
                       dec(b[j+1]);
                       if (b[j+1]=-1)or(b[j]=10) then begin
                                                      dec(b[j]);
                                                      inc(b[j+1]);
                                                      end
                                                 else begin
                                                      fillchar(hash1,sizeof(hash1),false);
                                                      fillchar(hash2,sizeof(hash2),false);
                                                      for q:=1 to k1 do
                                                          hash1[ord(a[q])]:=true;
                                                      for q:=1 to k2 do
                                                          hash2[ord(b[q])]:=true;
                                                      f:=true;
                                                      for q:=0 to 9 do
                                                          if hash1[q]<>hash2[q] then begin
                                                                                     f:=false;
                                                                                     break;
                                                                                     end;
                                                      if f=true then begin
             							     writeln('almost friends');
								     break;
								     end
                                                                 else begin
                                                                      dec(b[j]);
                                                                      inc(b[j+1]);
                                                                      end;
                                                      end;
                       end;
                   end;
    if f=false then writeln('nothing');
    end;
close(input);
close(output);
end.
