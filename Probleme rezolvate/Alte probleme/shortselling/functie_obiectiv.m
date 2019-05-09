function [val,V]=functie_obiectiv(Q,rmed,alpha,B,ro,Rp,x)
  % val = valoarea functiei
  % V = varianta portofoliului care masoara gradul de risc
  
val=((alpha+B*x).')*Q*(alpha+B*x)+(ro/(Rp^2))*((rmed.')*alpha-Rp+(rmed.')*B*x)^2;
%disp(val);
V=((alpha+B*x).')*Q*(alpha+B*x);
%disp(V);
end

