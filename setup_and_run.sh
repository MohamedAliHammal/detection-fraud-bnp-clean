#!/bin/bash

set -e  # Stop if any command fails

echo "=========================="
echo "Setting up virtual environment..."
echo "=========================="

python3 -m venv .venv
source .venv/bin/activate

echo "=========================="
echo "Installing dependencies..."
echo "=========================="

cat <<EOL > requirements.txt
pandas
numpy
scikit-learn
matplotlib
xgboost
lightgbm
notebook
jupyter
nbconvert
EOL

pip install --upgrade pip
pip install -r requirements.txt

echo "=========================="
echo "Running notebook end-to-end..."
echo "=========================="

cd notebooks

# Run notebook non-interactively and save results
jupyter nbconvert --to notebook --execute fraud_detection_bnp.ipynb --output fraud_detection_bnp_output.ipynb

echo "=========================="
echo "✅ Notebook executed successfully"
echo "=========================="
echo "📁 Output notebook: notebooks/fraud_detection_bnp_output.ipynb"
echo "📄 Submission file saved to: output/submission_lgbm.csv"
