# 🚴‍♂️ Local Bikes – Data Models Overview

Bienvenue dans le dépôt de projet **Local Bikes**, une initiative data visant à structurer, enrichir et analyser les données d’achats clients dans l’univers du vélo. Ce projet repose sur deux modèles analytiques principaux construits avec dbt : `int_order_items` et `_mrt_orders_to_customers`. Ces modèles permettent de suivre la performance des commandes, la répartition des produits, et la fidélisation client.

Voici le lien du projet: 
---

## 📊 Modèle : `int_order_items`

Ce modèle fournit une **vue agrégée des commandes**, en combinant plusieurs sources telles que les articles commandés, les informations utilisateur et les retours clients. Il permet d’analyser de manière fine chaque transaction.

### KPIs calculés :

- **Total Order Amount** : Somme des montants de tous les articles d’une commande.
- **Total Items** : Quantité totale d’articles dans la commande.
- **Total Distinct Items** : Nombre de types de produits différents par commande.
- **Average Order Value (AOV)** : Dépense moyenne par transaction.
- **Product Margin** : Marge réalisée sur chaque produit vendu.
- **User Information** : Enrichissement des commandes avec des données utilisateur (ville, région, etc.).

🧠 **Utilité** : Ce modèle permet d’analyser les performances commerciales, de comprendre les préférences produits par région, et d’identifier les comportements d'achat.

---

## 👤 Modèle : `_mrt_orders_to_customers`

Ce modèle agrège les commandes **au niveau client**, croisant les données de commandes, d’articles, de catégories et de marques, afin de suivre la valeur et la rétention client dans le temps.

### KPIs calculés :

- **Customer Lifetime Value (CLV)** : Revenu total estimé qu’un client génère durant sa relation avec l’entreprise.  
  > _Formule : `SUM(sale_amount) * Average Customer Lifespan / Number of Customers`_
- **Customer Retention Rate** : Pourcentage de clients récurrents sur une période donnée.

🧠 **Utilité** : Ce modèle sert à mieux cibler les actions marketing, à identifier les segments de clients fidèles, et à évaluer la rentabilité long terme.

---

## 🔧 Stack technique

- **dbt** pour la modélisation de données
- **BigQuery** ou Snowflake (à adapter selon ton stack)
- **Sources** : `orders`, `order_items`, `users`, `products`, `brands`, `categories`

---

## 📂 Structure du projet

models/
│
├── intermediate/
│   └── int_order_items.sql
│
├── marts/
│   └── _mrt_orders_to_customers.sql
│
└── docs/
└── README.md (ce fichier)



