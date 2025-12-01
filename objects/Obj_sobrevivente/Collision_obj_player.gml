
//Aumenta o contador global
global.resgatados += 1;

// 3. Efeito visual (Opcional - mensagem flutuante, particula)
// instance_create_layer(x, y, "Effects", obj_efeito_resgate);

// 4. Remove a sobrevivente da fase
instance_destroy();