Sets
    a "ambulancias" /A1, A2, A3/
    h "hospitales" /H1, H2, H3, H4, H5/;
     
    
Table
capacidad(a,h) "Cantidad de vacunas que cada ambulancia puede transportar a cada hospital"
    H1  H2  H3  H4  H5
A1  10  8   6   9   12
A2  5   3   8   4   10
A3  7   9   6   10  4;

Parameter viajes_max(a) "Número de viajes máximo que puede hacer cada ambulancia"
/A1  50  
A2  90
A3  60/;

Parameter ambulancias_max(h) "Número máximo de ambulancias que puede recibir cada hospital"
/H1 100
H2 80
H3 70
H4 40
H5 20/;

Positive Variables
    x(a, h) "Número de viajes que cada ambulancia realiza a cada hospital";
    
Variable z "Cantidad total de vacunas distribuidas";

Equations
    max_vacunas "Maximizar la cantidad total de vacunas distribuidas"
    max_viajes_amb(a) "Restricción de número máximo de viajes por ambulancia"
    max_amb_hosp(h) "Restricción de número máximo de ambulancias por hospital";

max_vacunas.. z =e= sum((a, h), x(a, h) * capacidad(a, h));

max_viajes_amb(a).. sum(h, x(a, h)) =l= viajes_max(a);

max_amb_hosp(h).. sum(a, x(a, h)) =l= ambulancias_max(h);

Model todas /all/;
Solve todas using LP maximizing z;
display x.l,z.l
