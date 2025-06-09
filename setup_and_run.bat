@echo off
echo ==========================
echo Setting up virtual environment...
echo ==========================

python -m venv .venv
call .venv\Scripts\activate

echo ==========================
echo Installing dependencies...
echo ==========================

REM Generate requirements.txt
(
echo pandas
echo numpy
echo scikit-learn
echo matplotlib
echo xgboost
echo lightgbm
echo notebook
) > requirements.txt

pip install --upgrade pip
pip install -r requirements.txt

echo ==========================
echo Launching Jupyter Notebook...
echo ==========================

cd notebooks
jupyter notebook fraud_detection_bnp.ipynb
