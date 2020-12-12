fid= fopen('C:\Users\thiag\PycharmProjects\Bioinformatics\Bioinformatics\Week_1\vibrio_colerae.txt.txt','r');
% vibrio colarae GENOME OR INSERT ANY OF YOUR CHOICE
genome= textscan(fid,'%s');
fclose(fid);
genome = genome{1,1};
genome = genome{1,1};           % CONVERT TO CELL ARRAY
%%

% VARIABLES FOR STORING TRANSITIONS

AA = 0;
AT = 0;
AC = 0;
AG = 0;
TA = 0;
TT = 0;
TC = 0;
TG = 0;
CA = 0;
CT = 0;
CC = 0;
CG = 0;
GA = 0;
GT = 0;
GC = 0;
GG = 0;


% ITERATOR 

for pos=1:length(genome)-1
  

    sec = genome(pos:pos+1);

    if strcmp(sec, 'AA')
        AA = AA + 1;
    elseif strcmp(sec,'AT')
        AT = AT + 1;
    elseif strcmp(sec,'AC')
        AC = AC + 1;
    elseif strcmp(sec,'AG')
        AG = AG + 1;
    elseif strcmp(sec,'TA')
        TA = TA + 1;
    elseif strcmp(sec,'TT')
        TT = TT + 1;
    elseif strcmp(sec,'TC')
        TC = TC + 1;
    elseif strcmp(sec,'TG')
        TG = TG + 1;
    elseif strcmp(sec,'CA')
        CA = CA + 1;
    elseif strcmp(sec,'CT')
        CT = CT + 1;
    elseif strcmp(sec,'CC')
        CC = CC + 1;
    elseif strcmp(sec,'CG')
        CG = CG + 1;
    elseif strcmp(sec,'GA')
        GA = GA + 1;
    elseif strcmp(sec,'GT')
        GT = GT + 1;
    elseif strcmp(sec,'GC')
        GC = GC + 1;
    elseif strcmp(sec,'GG')
        GG = GG + 1;

    end
        
end

% CREATES THE MATRIX

T_raw = [   AA  TA  CA  GA  ;
            AT  TT  CT  GT  ;
            AC  TC  CC  GC  ;
            AG  TG  CG  GG  ];
        
T = T_raw ./ sum(T_raw)                 % PRINTS THE NORMALIZED MATRIX
 
mc = dtmc(T, 'StateNames', ["A" "T" "C" "G"]);

colorbar('Ticks',[0,0.3,0.5,0.8,1]);

graphplot(mc, 'ColorEdges', true, 'LabelEdges', true);

