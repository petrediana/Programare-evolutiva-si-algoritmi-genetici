function [ OK ] = este_fezabil( individ )
    
    OK = true;
    if individ(1) + individ(4) < 100 %nu indeplinesc necesarul minim la Ploiesti
        OK = false;
    end;
    
    if individ(2) + individ(5) < 60 %nu indeplinesc necesarul minim la Pitesti
        OK = false;
    end;
    
    if individ(3) + individ(6) < 80 %nu indeplinesc necesarul minim la Cluj
        OK = false;
    end;
end

