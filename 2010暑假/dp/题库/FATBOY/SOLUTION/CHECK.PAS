const maxlen=100;
var i:longint;
    yourans,answer:string;
    email:array [1..3] of string;

procedure error;
begin
     writeln;
     writeln('Error!');
     writeln;
     halt
end;

function min(x,y:longint):longint;
begin
     if x<y then min:=x else min:=y
end;

function verify(sub,source:string):boolean;
var i,j,k,m:longint;
    state:array [0..maxlen,-4..maxlen] of boolean;
begin
     fillchar(state,sizeof(state),false);
     for j:=0 to 3 do state[0,j]:=true;
     for i:=1 to length(sub) do
         for j:=i to min(length(source),4*i) do
             for m:=4 downto 1 do
                 if state[i-1,j-m] then
                    for k:=0 to m-1 do
                        if sub[i]=source[j-k]
                           then state[i,j]:=true;
     if state[length(sub),length(source)]
        then verify:=true
        else verify:=false
end;

begin
     assign(input,'fatboy.out');
     reset(input);
     readln(yourans);
     close(input);
     assign(input,'fatboy.out');
     reset(input);
     readln(answer);
     close(input);
     if length(yourans)<>length(answer) then error;
     assign(input,'fatboy.in');
     reset(input);
     for i:=1 to 3 do readln(email[i]);
     close(input);
     for i:=1 to 3 do
         if not(verify(yourans,email[i])) then error;
     writeln;
     writeln('Right!');
     writeln;
end.