function [val,v]=hillclimbing(a,b,MAX,k,eps)

%% Exemplu de apel
%hillclimbing(-2,2,10,50,0.001);

%% Aplica hill climbing de MAX ori functiei definite de f_obiectiv pe [a,b]x[a,b]
% MAX este numarul maxim de generari akeatoare a punctelor de start in
% cautarea valorii de maxim local pentru functie
% k - stabileste numarul maxim de vecini calculati pentru punctul curent
% maxim 4*k*(k+1) vecini

% Vecinii punctului curent sunt punctele in care fiecare componenta i (i=1,2) se afla la una din distantele -k*eps,
% -(k-1)*eps,...,(k-1)*eps, k*eps fata de componenta i a punctului curent
% si care apartin [a,b]x[a,b]

%val - cea mai buna valoare calculata in MAX repetari ale functiei hill climbing
%v - punctul in care este atinsa val

%% Implementare
V=[];
% V - multimea punctelor calculate de hill climbing - vom avea cate o varianta de
% optim local pentru fiecare generare aleatoare
for t=1:MAX
    % aplicarea algoritmului hill climbing a t-a oara, sau la momentul t
    local=0; %initializare flag pentru gasirea unui optim
    vc=unifrnd(a,b,1,2); %generam o pereche (x,y) aleatoare din distributia [a,b]
    %varful curent
    valm=f_obiectiv(vc(1),vc(2)); %calculam fitnessul pt acest punct
    %valoarea varfului curent
    
    %val va fi valoarea maxima globala iar v solutia (x,y) care o detrmina
    %pentru primul pas maximul global va fi initializat cu prima pereche
    %generata (doar prima data!)
    if (t==1)
        val=valm;
        v=vc;
    end;
    %initializarea celei mai bune valori
    
    while(local==0) %cat timp nu am gasit un optim
        %calculam valoarea varfului curent
        valc=f_obiectiv(vc(1),vc(2)); 
        
        %calculul multimiii vecinilor, nv, insotiti de valorile acestora -include si punctul curent
        [nv]=calcul_vecini(vc,a,b,k,eps);
        
        %valoarea maxima si cel mai bun vecin, inclusiv punctul curent
        [vmax,poz]=max(nv(:,3));
        
        if(vmax>valc) %daca vmax curenta e mai buna decat cea a punctului initial
            valm=vmax; % o salvez
            vc=nv(poz,1:2); % si salvez si perechea care o detrmina (x,y) de pe poz cu val max
            % am gasit un vecin strict mai bun decat verful curent, pe linia poz
        else
            local=1; %FOARTE IMPORTANT: DACA GASESTE UN VECIN MAI BUN DECAT PUNCTUL DE PLECARE
            %ATUNCI VECINUL CEL MAI BUN VA DEVENI PUNCTUL CURENT DE
            %REFERINTA, LOCAL RAMANE 0 SI SE REIA WHILE-UL, CAUTAM NOI VECINI AI ACESTUIA NOU 
            % ALTFEL punctul curent este cel mai bun, stop pe un posibil
            % optim local, CU LOCAL = 1 => iese din while
        end;
    end;
    
	
	if(valm>val) %daca valoarea de maxim local gasita acum este cea mai buna gasita
        val=valm; % o salvez in variabilele de isire (de maxim global)
        v=vc;
        timp=t; %si salvez si iteratia la care s-a gasit
    end;
    
    %indiferent daca este sau nu punct de maxim global, oricum il salvez in
    %vectorul V in care trec toate maximele locale => V va avea dimensiunea
    %MAX linii coresp MAX iteratii
    V=[V;vc];
end;

disp('Punctul de optim calculat:');
disp(v);
disp(['Valoarea ' num2str(val)]);
disp(['La iteratia ' num2str(timp)]);

%screim functia de afisare a graficului
plot_obiectiv(V,timp,a,b);
end
        
