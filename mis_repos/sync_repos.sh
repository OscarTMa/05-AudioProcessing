#!/bin/bash

# Lista de URLs de los repositorios
repos=(
    "https://github.com/OscarTMa/01-CAC40.git"
    "https://github.com/OscarTMa/02-Health.git"
    "https://github.com/OscarTMa/03-NLP.git"
    "https://github.com/OscarTMa/04-Computer_Vision.git"
    "https://github.com/OscarTMa/05-AudioProcessing.git"
    # Añade más URLs según sea necesario
)

# Directorio donde se clonarán los repositorios
base_dir="$HOME/mis_repos"

# Crear el directorio base si no existe
mkdir -p "$base_dir"

# Función para clonar o actualizar un repositorio
sync_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url" .git)
    local repo_dir="$base_dir/$repo_name"

    if [ -d "$repo_dir" ]; then
        echo "Actualizando $repo_name"
        cd "$repo_dir"
        git fetch origin
        git merge origin/main
    else
        echo "Clonando $repo_name"
        git clone "$repo_url" "$repo_dir"
    fi
}

# Iterar sobre la lista de repositorios y sincronizarlos
for repo_url in "${repos[@]}"; do
    sync_repo "$repo_url"
done

