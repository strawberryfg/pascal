var a:array[1..100]of char;
    i,j:char;
begin
  assign(input,'krunch.in');
  reset(input);
  assign(output,'krunch.out');
  rewrite(output);
  read(a[i]);
    procedure len(l,r,a[i]);
    Delete(a[i],'A',i);
    Delete(a[i],'E',i);
    Delete(a[i],'I',i);
    Delete(a[i],'O',i);
    Delete(a[i],'U',i);
    if len(l)<='_' then Delete(a[i],'_',i)
                   else Delete(a[i],'_',i);
    begin
      if j=i then delete(a[i],j,i);
      write(a[i-j]);
    end;
  close(input);
  close(output);
end.