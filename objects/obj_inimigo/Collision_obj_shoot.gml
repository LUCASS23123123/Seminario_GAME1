
// Só toma dano se não estiver invulnerável na morte
if (!death_invulnerable) {
    hp -= 1;

    hurt_timer = 15;
    state = "hurt";
}

// destrói o tiro sempre
instance_destroy(other);

