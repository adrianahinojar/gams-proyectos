Sets 
    i  "desarrolladores" /d1*d5/ 
    j  "proyectos" /p1*p5/;


Parameters
    tiempo(i,j)  "Tiempo estimado para cada proyecto j por cada desarrollador i"
            / d1.p1 38, d1.p2 41, d1.p3 43, d1.p4 32, d1.p5 48
              d2.p1 27, d2.p2 21, d2.p3 28, d2.p4 16, d2.p5 26
              d3.p1 40, d3.p2 36, d3.p3 31, d3.p4 23, d3.p5 32
              d4.p1 39, d4.p2 28, d4.p3 39, d4.p4 27, d4.p5 35
              d5.p1 32, d5.p2 25, d5.p3 40, d5.p4 27, d5.p5 37 /;
              

Binary Variable
    x(i,j)  "1 si el desarrollador i realiza el proyecto j, y 0 cuando no";
    
Variable
    z   "Tiempo total empleado por los desarrolladores";
    
Equations
    funcionobjetivo "Minimizar el tiempo total empleado"
    asignacionDesarrollador(i) "Cada proyecto se asigna a un único desarrollador"
    asignacionProyecto(j) "Cada desarrollador trabaja en un solo proyecto";
    
    funcionobjetivo.. z =e= sum((i,j), tiempo(i,j)*x(i,j));
    
    asignacionDesarrollador(i).. sum(j, x(i,j)) =e= 1;
    
    asignacionProyecto(j).. sum(i, x(i,j)) =e= 1;

Model todas /all/;
Solve todas using mip minimizing z;
display z.l, x.l
