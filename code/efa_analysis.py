# efa_analysis.py
# Python script to clean data, run EFA, and create visualizations

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from factor_analyzer import FactorAnalyzer
from sklearn.preprocessing import LabelEncoder

# Load Data
df = pd.read_stata('CP_weighted.dta')

# Clean Data: Recode survey responses
df.replace([-8, -9], np.nan, inplace=True)  # Replace "Don't know"/"Refused" with NaN

# Select Likert-scale items for EFA
likert_items = [col for col in df.columns if 'centrality' in col or 
                'success' in col or 'statusattitudes' in col or 
                'envibeh' in col or 'waste' in col or 'consneg' in col or
                'happiness' in col]

df_likert = df[likert_items].dropna()

# Scree Plot
fa = FactorAnalyzer()
fa.fit(df_likert)
ev, v = fa.get_eigenvalues()

plt.figure(figsize=(8,6))
plt.plot(range(1, len(ev)+1), ev, 'o-', label='Eigenvalues')
plt.axhline(1, color='red', linestyle='--')
plt.title('Scree Plot')
plt.xlabel('Factors')
plt.ylabel('Eigenvalue')
plt.grid()
plt.legend()
plt.savefig('scree_plot.png')
plt.close()

# Run Factor Analysis (4 factors)
fa = FactorAnalyzer(n_factors=4, rotation='varimax')
fa.fit(df_likert)

# Loadings
loadings = pd.DataFrame(fa.loadings_, index=df_likert.columns)
loadings.to_csv('efa_loadings.csv')

# Heatmap
plt.figure(figsize=(10,12))
sns.heatmap(loadings, annot=True, cmap="coolwarm", center=0)
plt.title('Factor Loadings Heatmap (EFA)')
plt.savefig('efa_heatmap.png')
plt.close()
