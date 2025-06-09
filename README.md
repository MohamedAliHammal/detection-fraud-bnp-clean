# BNP Fraud Detection - LightGBM Only

## 📁 Structure du projet

```
detection-fraud-bnp/
├── data/
│   └── raw/               # Données brutes (X_train, y_train, X_test)
├── notebooks/
│   └── fraud_detection_bnp.ipynb  # Notebook principal (LightGBM uniquement)
│   └── fraud_stacking_advanced.ipynb  # Modèle stacking exploratoire (non soumis)
├── output/                # Dossier des résultats et soumissions
├── requirements.txt       # Dépendances Python
├── setup_and_run.sh       # Script pour lancer l’environnement et le notebook (Linux/macOS)
├── setup_and_run.bat      # Script équivalent pour Windows
└── README.md              # Ce fichier
```

## 🚀 Lancer le projet

### ✅ Option 1 : Exécution manuelle

```bash
# 1. Créer un environnement virtuel
python3 -m venv .venv
source .venv/bin/activate

# 2. Installer les dépendances
pip install --upgrade pip
pip install -r requirements.txt

# 3. Lancer le notebook
cd notebooks
jupyter notebook fraud_detection_bnp.ipynb
```

### ⚙️ Option 2 : Script automatique

#### 🔹 Sous Linux / macOS

```bash
chmod +x setup_and_run.sh
./setup_and_run.sh
```

#### 🔹 Sous Windows

```cmd
setup_and_run.bat
```

Ce script :
1. Crée un environnement virtuel (`.venv`)
2. Installe toutes les dépendances nécessaires
3. Lance automatiquement le notebook `fraud_detection_bnp.ipynb`

## 🔍 Modèle utilisé
Le modèle utilisé dans le notebook est **LightGBM**, sélectionné après comparaison avec deux autres modèles classiques.

## 🔍 Choix des modèles

Trois modèles de classification ont été testés pour détecter les fraudes dans les données :

| Modèle         | Validation PR-AUC |
|----------------|-------------------|
| RandomForest   | 0.1900            |
| XGBoost        | 0.1866            |
| **LightGBM**   | **0.1901**        |

LightGBM a obtenu la meilleure performance en termes de PR-AUC sur l'ensemble de validation.  
Par conséquent, les deux autres modèles (RandomForest et XGBoost) ont été **commentés** dans le notebook `fraud_detection_bnp.ipynb` pour se concentrer uniquement sur le modèle le plus prometteur.

> **Extrait commenté du notebook :**
> ```python
> models = {
>     #"RandomForest": RandomForestClassifier(n_estimators=100, random_state=42, n_jobs=-1),
>     #"XGBoost": XGBClassifier(n_estimators=100, use_label_encoder=False, eval_metric="logloss", random_state=42),
>     "LightGBM": LGBMClassifier(n_estimators=100, random_state=42)
> }
> ```

Un avertissement a également été généré avec XGBoost concernant un paramètre obsolète (`use_label_encoder`). Celui-ci n'a pas d'impact direct sur les résultats mais illustre que ce modèle n'apportait pas de gain de performance malgré l'optimisation de base.

## 🔧 Travaux en cours

Des expérimentations sont en cours pour améliorer les performances actuelles :

- ✅ **Modèle Stacking avancé** (empilement de plusieurs algorithmes avec méta-apprenant)
- ✅ **Transformations de données avancées** : création de nouvelles features, ratios, interactions entre variables, encodage ciblé
- ✅ **Intégration de données externes** : enrichissement du dataset avec des profils utilisateurs simulés, historiques ou métadonnées (exemples à venir)

> Ces améliorations sont testées dans le notebook `fraud_stacking_advanced.ipynb`, non inclus dans le processus de soumission car leur exécution est plus longue (plusieurs heures).

---

📧 Pour toute question ou amélioration, n’hésitez pas à me contacter !
