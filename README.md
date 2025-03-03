# S3CMD Docker Container

## Présentation

Ce dépôt est un container docker avec la librairie s3cmd.
S3cmd est un outil de ligne de commande gratuit, c'est un client pour télécharger, récupérer et gérer des données dans Amazon S3 et d'autres fournisseurs de services de stockage en cloud qui utilisent le protocole S3.
Il est également idéal pour les scripts batch et les sauvegardes automatisées vers S3, déclenchées par cron, etc.
S3cmd est écrit en Python. Il s'agit d'un projet open source disponible sous la licence publique GNU v2 (GPLv2) et il est gratuit pour un usage commercial et privé.

## Usage

IMPORTANT : renommer le fichier .env.exemple en .env puis le compléter

```bash
docker compose up
```

### Script à exécuter pour supprimer les fichier d'un répertoire dont la date de création est supérieur à 30 jours (exemple pour Valcor)

```bash
sh /data/tools/delete_files.sh "bckp-valcor/data/coolify/backups/databases/l8l-team-15691/valcor-website-cms-strapi/" "30 days"
```

Commande générique

```bash
sh /data/tools/delete_files.sh <chemin_fichiers_a_supprimer> <depuis_quand>
```

### Définir un "Lifecycle policy" sur un bucket

```bash
s3cmd --host=$S3_ENDPOINT --region=$S3_REGION --host-bucket=<BUCKET_NAME>.$S3_ENDPOINT --access_key=$S3_ACCESS_KEY --secret_key=$S3_SECRET_KEY setlifecycle /data/tools/expiry_<project>.xml s3://<BUCKET_NAME>
```

### Référence

[Documentation officielle de S3cmd](https://s3tools.org/usage)