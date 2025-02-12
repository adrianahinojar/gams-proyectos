Sets
    i  "Tipos de Materiales" /P_Blanco, P_Azul, D_Acrilico, R_Epoxi/ 
    j  "Tipos de Mezcla" /Base, Especial/;

Parameters
    cantidad_disponible(i) "Cantidad disponible de cada tipo de material (litros)" / 
        P_Blanco 4000, 
        P_Azul 8000, 
        D_Acrilico 4500, 
        R_Epoxi 3000 /
    coste_transporte(i) "Coste de transporte de cada tipo de material (€/litro)" / 
        P_Blanco 5.2, 
        P_Azul 7.5, 
        D_Acrilico 3.9, 
        R_Epoxi 5.1 /
    coste_mezcla(j) "Coste de cada tipo de mezcla (€/litro)" /Base 5.7, Especial 6.3/
    cantidad_minima_necesaria(j) "Cantidad mínima necesaria para cada tipo de mezcla (litros)" /Base 4500, Especial 7500/;
Positive Variables
    x(i, j) "Cantidad de cada tipo de material utilizado en cada tipo de mezcla (litros)";
    
Variables
    costo_produccion "Costo total de producción de pintura (€)"
    costo_transporte "Costo total de transporte de materiales (€)"
    costo_total "Costo total de producción y transporte de pintura (€)";

Equations
    restriccion_cantidad_minima(j) "Restricción de cantidad mínima necesaria para cada tipo de mezcla"
    restriccion_cantidad_disponible(i) "Restricción de cantidad disponible de cada tipo de material"
    restriccion_coste_produccion "Restricción de coste total de producción"
    restriccion_coste_transporte "Restricción de coste total de transporte"
    restriccion_porcentaje_base "Restricción de porcentaje para la mezcla Base"
    restriccion_porcentaje_disolvente_base "Restricción de porcentaje de disolvente para la mezcla Base"
    restriccion_porcentaje_total_base "Restricción de porcentaje total para la mezcla Base"
    restriccion_porcentaje_especial "Restricción de porcentaje para la mezcla Especial"
    restriccion_porcentaje_resina_especial "Restricción de porcentaje de resina para la mezcla Especial"
    restriccion_porcentaje_total_especial "Restricción de porcentaje total para la mezcla Especial"
    restriccion_costo_total "Restricción de costo total";

restriccion_cantidad_minima(j).. sum(i, x(i,j)) =e= cantidad_minima_necesaria(j);

restriccion_cantidad_disponible(i).. sum(j, x(i,j)) =l= cantidad_disponible(i);

restriccion_coste_produccion.. costo_produccion =e= sum((i, j), coste_mezcla(j)*x(i,j));

restriccion_coste_transporte.. costo_transporte =e= sum((i, j), coste_transporte(i)*x(i,j));

restriccion_porcentaje_base.. (x('P_Blanco','Base') + x('P_Azul','Base')) =l= 0.5 * sum(i, x(i, 'Base'));

restriccion_porcentaje_disolvente_base.. (x('D_Acrilico','Base')) =g= 0.1 * sum(i, x('D_Acrilico', 'Base'));

restriccion_porcentaje_total_base.. (x('P_Blanco','Base') + x('P_Azul','Base') + x('D_Acrilico','Base') + x('R_Epoxi','Base')) =g= 0.99 * sum(i, x(i, 'Base'));

restriccion_porcentaje_especial.. (x('P_Blanco','Especial')) =g= 0.2 * sum(i, x(i, 'Especial'));

restriccion_porcentaje_resina_especial.. (x('R_Epoxi','Especial') + x('D_Acrilico','Especial')) =g= 0.5 * (x('P_Blanco','Especial') + x('P_Azul','Especial'));

restriccion_porcentaje_total_especial.. (x('P_Blanco','Especial') + x('P_Azul','Especial') + x('D_Acrilico','Especial') + x('R_Epoxi','Especial')) =g=0.98 * sum(i, x(i, 'Especial'));

restriccion_costo_total.. costo_total =e= costo_produccion + costo_transporte;

Model todas /all/;

Solve todas using lp minimizing costo_total;

Display x.l, costo_total.l;
