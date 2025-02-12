Sets
    Ingredientes /Cabra, Oveja/;

Parameters
    Costo(Ingredientes)
        /Cabra 0.3
        Oveja 0.4/,
    Mano_de_obra(Ingredientes)
        /Cabra 4
        Oveja 2/,
    Grasa(Ingredientes)
        /Cabra 8
        Oveja 20/;

Variables
    x1 "Cantidad de leche de cabra utilizada en la producción del queso"
    x2 "Cantidad de leche de oveja utilizada en la producción del queso"
    z1 "Coste de producción"
    z2 "Mano de obra"
    z3 "Porcentaje de grasa";
    

Positive Variables x1, x2;

Equations
    Coste_de_produccion
    Mano_de_obra_total
    Porcentaje_de_grasa
    Limite_mano_de_obra
    Limite_leche_cabra
    Contenido_grasa_minimo;

Coste_de_produccion.. 0.3 * x1 + 0.4 * x2 =e= z1;

Mano_de_obra_total.. 4 * x1 + 2 * x2 =e= z2;

Porcentaje_de_grasa.. 0.08 * x1 + 0.2 * x2 =e= z3;

Limite_mano_de_obra.. 4 * x1 + 2 * x2 =l= 15;

Limite_leche_cabra.. x1 =l= 3;

Contenido_grasa_minimo.. 0.08 * x1 + 0.2 * x2 =g= 0.35;

Model Queso /all/;
solve Queso using MIP minimizing z1;
display z1.l, x1.l, x2.l;
solve Queso using MIP minimizing z2;
display z2.l, x1.l, x2.l;
solve Queso using MIP maximizing z3;
display z3.l,x1.l, x2.l;