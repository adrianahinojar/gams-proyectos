Variable z;

Positive variables S1 servidor 1,S2 servidor 2;

Equations Obj,Restriccion1,Restriccion2,Restriccion3;

*Función objetivo
Obj..z =E= 10*S1 + 20*S2;

*Restricciones
Restriccion1..5*S1 + 10*S2 =L= 200;
Restriccion2..2*S1 + 4*S2 =L= 100;
Restriccion3..S2 =L= S1+5

Model CapProcesamiento /all/;
Solve CapProcesamiento using LP maximizing z;
Display S1.l,S2.l;








