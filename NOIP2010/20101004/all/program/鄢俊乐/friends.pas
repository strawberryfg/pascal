var hx,hy:array[0..9] of longint;
    b:boolean;
    c:char;
    n,i,j,k:longint;
    xs,ys:string;
begin
assign(input,'friends.in');
reset(input);
readln(n);
assign(output,'friends.out');
rewrite(output);
for i:=1 to n do
    begin
    for j:=0 to 9 do
        begin
        hx[j]:=0;
        hy[j]:=0;
        end;
    read(c);
    xs:='';
    while c<>' ' do
          begin
          inc(hx[ord(c)-48]);
          xs:=xs+c;
          read(c);
          end;
    read(c);
    ys:='';
    while (c>='0') and (c<='9') do
          begin
          inc(hy[ord(c)-48]);
          ys:=ys+c;
          read(c);
          end;
    readln;
    b:=true;
    for j:=0 to 9 do
        if (hx[j]<>hy[j]) and (hx[j]*hy[j]=0)
           then begin
                b:=false;
                break;
                end;
    if b
       then begin
            writeln('friends');
            continue;
            end;
    if length(xs)>1
       then begin
            if (ord(xs[1])>49) and (ord(xs[2])<57)
               then begin
                    dec(hx[ord(xs[1])-48]);
                    dec(hx[ord(xs[2])-48]);
                    inc(hx[ord(xs[1])-49]);
                    inc(hx[ord(xs[2])-47]);
                    b:=true;
                    for j:=0 to 9 do
                        if (hx[j]<>hy[j]) and (hx[j]*hy[j]=0)
                           then begin
                                b:=false;
                                break;
                                end;
                    if b
                       then begin
                            writeln('almost friends');
                            continue;
                            end
                       else begin
                            dec(hx[ord(xs[1])-49]);
                            dec(hx[ord(xs[2])-47]);
                            inc(hx[ord(xs[1])-48]);
                            inc(hx[ord(xs[2])-48]);
                            end;
                    end;
            if (ord(xs[1])<57) and (ord(xs[2])>48)
               then begin
                    dec(hx[ord(xs[1])-48]);
                    dec(hx[ord(xs[2])-48]);
                    inc(hx[ord(xs[1])-47]);
                    inc(hx[ord(xs[2])-49]);
                    b:=true;
                    for k:=0 to 9 do
                        if (hx[k]<>hy[k]) and (hx[k]*hy[k]=0)
                           then begin
                                b:=false;
                                break;
                                end;
                    if b
                       then begin
                            writeln('almost friends');
                            continue;
                            end
                       else begin
                            dec(hx[ord(xs[1])-47]);
                            dec(hx[ord(xs[2])-49]);
                            inc(hx[ord(xs[1])-48]);
                            inc(hx[ord(xs[2])-48]);
                            end;
                    end;
            for j:=2 to length(xs)-1 do
                begin
                if (ord(xs[j])>48) and (ord(xs[j+1])<57)
                   then begin
                        dec(hx[ord(xs[j])-48]);
                        dec(hx[ord(xs[j+1])-48]);
                        inc(hx[ord(xs[j])-49]);
                        inc(hx[ord(xs[j+1])-47]);
                        b:=true;
                        for k:=0 to 9 do
                            if (hx[k]<>hy[k]) and (hx[k]*hy[k]=0)
                               then begin
                                    b:=false;
                                    break;
                                    end;
                        if b
                           then begin
                                writeln('almost friends');
                                break;;
                                end
                           else begin
                                dec(hx[ord(xs[j])-49]);
                                dec(hx[ord(xs[j+1])-47]);
                                inc(hx[ord(xs[j])-48]);
                                inc(hx[ord(xs[j+1])-48]);
                                end;
                        end;
                if (ord(xs[j])<57) and (ord(xs[j+1])>48)
                   then begin
                        dec(hx[ord(xs[j])-48]);
                        dec(hx[ord(xs[j+1])-48]);
                        inc(hx[ord(xs[j])-47]);
                        inc(hx[ord(xs[j+1])-49]);
                        b:=true;
                        for k:=0 to 9 do
                            if (hx[k]<>hy[k]) and (hx[k]*hy[k]=0)
                               then begin
                                    b:=false;
                                    break;
                                    end;
                        if b
                           then begin
                                writeln('almost friends');
                                break;
                                end
                           else begin
                                dec(hx[ord(xs[j])-47]);
                                dec(hx[ord(xs[j+1])-49]);
                                inc(hx[ord(xs[j])-48]);
                                inc(hx[ord(xs[j+1])-48]);
                                end;
                        end;
                end;
            if b
               then continue;
            end;
    if length(ys)>1
       then begin
            if (ord(ys[1])>49) and (ord(ys[2])<57)
               then begin
                    dec(hy[ord(ys[1])-48]);
                    dec(hy[ord(ys[2])-48]);
                    inc(hy[ord(ys[1])-49]);
                    inc(hy[ord(ys[2])-47]);
                    b:=true;
                    for j:=0 to 9 do
                        if (hx[j]<>hy[j]) and (hx[j]*hy[j]=0)
                           then begin
                                b:=false;
                                break;
                                end;
                    if b
                       then begin
                            writeln('almost friends');
                            continue;
                            end
                       else begin
                            dec(hy[ord(ys[1])-49]);
                            dec(hy[ord(ys[2])-47]);
                            inc(hy[ord(ys[1])-48]);
                            inc(hy[ord(ys[2])-48]);
                            end;
                    end;
            if (ord(ys[1])<57) and (ord(ys[2])>48)
               then begin
                    dec(hy[ord(ys[1])-48]);
                    dec(hy[ord(ys[2])-48]);
                    inc(hy[ord(ys[1])-47]);
                    inc(hy[ord(ys[2])-49]);
                    b:=true;
                    for k:=0 to 9 do
                        if (hx[k]<>hy[k]) and (hx[k]*hy[k]=0)
                           then begin
                                b:=false;
                                break;
                                end;
                    if b
                       then begin
                            writeln('almost friends');
                            continue;
                            end
                       else begin
                            dec(hy[ord(ys[1])-47]);
                            dec(hy[ord(ys[2])-49]);
                            inc(hy[ord(ys[1])-48]);
                            inc(hy[ord(ys[2])-48]);
                            end;
                    end;
            for j:=2 to length(ys)-1 do
                begin
                if (ord(ys[j])>48) and (ord(ys[j+1])<57)
                   then begin
                        dec(hy[ord(ys[j])-48]);
                        dec(hy[ord(ys[j+1])-48]);
                        inc(hy[ord(ys[j])-49]);
                        inc(hy[ord(ys[j+1])-47]);
                        b:=true;
                        for k:=0 to 9 do
                            if (hx[k]<>hy[k]) and (hx[k]*hy[k]=0)
                               then begin
                                    b:=false;
                                    break;
                                    end;
                        if b
                           then begin
                                writeln('almost friends');
                                break;
                                end
                           else begin
                                dec(hy[ord(ys[j])-49]);
                                dec(hy[ord(ys[j+1])-47]);
                                inc(hy[ord(ys[j])-48]);
                                inc(hy[ord(ys[j+1])-48]);
                                end;
                        end;
                if (ord(ys[j])<57) and (ord(ys[j+1])>48)
                   then begin
                        dec(hy[ord(ys[j])-48]);
                        dec(hy[ord(ys[j+1])-48]);
                        inc(hy[ord(ys[j])-47]);
                        inc(hy[ord(ys[j+1])-49]);
                        b:=true;
                        for k:=0 to 9 do
                            if (hx[k]<>hy[k]) and (hx[k]*hy[k]=0)
                               then begin
                                    b:=false;
                                    break;
                                    end;
                        if b
                           then begin
                                writeln('almost friends');
                                break;
                                end
                           else begin
                                dec(hy[ord(ys[j])-47]);
                                dec(hy[ord(ys[j+1])-49]);
                                inc(hy[ord(ys[j])-48]);
                                inc(hy[ord(ys[j+1])-48]);
                                end;
                        end;
                end;
            if b
               then continue;
            end;
    writeln('nothing');
    end;
close(input);
close(output);
end.
