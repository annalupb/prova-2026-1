"""
Prova Iniciação à Computação 2026.1
"""

# 1.

print("Solucionando o problema 1...")
import pandas as pd
import seaborn as sns

df = pd.read_csv(
    "/workspaces/prova-2026-1/data/process.csv",
    sep=",",
    parse_dates=["timestamp"],
    na_values=["", "NA", "NaN"],
    low_memory=False,
)
print(df.head())
# Preenchimento de NaN: numéricos -> mediana; categóricos -> moda
num_cols = df.select_dtypes(include=["number"]).columns
cat_cols = df.select_dtypes(include=["object"]).columns

# Preencher numéricos com mediana
df[num_cols] = df[num_cols].fillna(df[num_cols].median())

# Preencher categóricos com moda (se existir), senão string vazia
for c in cat_cols:
    try:
        mode = df[c].mode()
        if not mode.empty:
            df[c].fillna(mode.iloc[0], inplace=True)
        else:
            df[c].fillna("", inplace=True)
    except Exception:
        df[c].fillna("", inplace=True)

print('\nApós preenchimento:')
print(df.head())
print('\nMissing por coluna (depois):')
print(df.isna().sum().to_string())
import os
import matplotlib.pyplot as plt

# garantir pasta de saída
out_dir = os.path.join("images", "results")
os.makedirs(out_dir, exist_ok=True)

# 1) Histograma da temperatura do reator para operating_regime == 'A'
print('\nSolucionando o problema 1... (histograma)')
df_A = df[df['operating_regime'] == 'A']
plt.figure(figsize=(8, 5))
sns.histplot(df_A['reactor_temp'].dropna(), bins=30, kde=False, color='C0')
plt.title('Histograma da temperatura do reator (condição A)')
plt.xlabel('Temperatura do reator (°C)')
plt.ylabel('Frequência')
hist_path = os.path.join(out_dir, 'hist_reactor_temp_A.png')
plt.tight_layout()
plt.savefig(hist_path)
plt.close()
print(f'Histograma salvo em: {hist_path}')

# 2) Média e desvio padrão para vibration_rms, motor_current e power_consumption_kw
print('\nSolucionando o problema 2... (média e desvio padrão)')
vars2 = ['vibration_rms', 'motor_current', 'power_consumption_kw']
stats = []
for v in vars2:
    mu = df[v].mean()
    sigma = df[v].std()
    stats.append({'variable': v, 'mu': mu, 'sigma': sigma})
stats_df = pd.DataFrame(stats)
stats_csv = os.path.join(out_dir, 'problem2_stats.csv')
stats_df.to_csv(stats_csv, index=False)
print('Tabela de média (μ) e desvio padrão (σ):')
print(stats_df.to_string(index=False))
print(f'Tabela salva em: {stats_csv}')

# 3) Evolução da pressão do reator entre 2024-02-16 08:00:00 e 2024-02-16 09:00:00
print('\nSolucionando o problema 3... (série temporal)')
start = pd.to_datetime('2024-02-16 08:00:00')
end = pd.to_datetime('2024-02-16 09:00:00')
mask = (df['timestamp'] >= start) & (df['timestamp'] <= end)
df_window = df.loc[mask].sort_values('timestamp')
plt.figure(figsize=(10, 4))
plt.plot(df_window['timestamp'], df_window['reactor_pressure'], marker='o', linestyle='-')
plt.title('Evolução da pressão do reator (2024-02-16 08:00 - 09:00)')
plt.xlabel('Timestamp')
plt.ylabel('Pressão do reator')
plt.xticks(rotation=45)
plt.tight_layout()
pressure_path = os.path.join(out_dir, 'pressure_2024-02-16_08-09.png')
plt.savefig(pressure_path)
plt.close()
print(f'Gráfico de pressão salvo em: {pressure_path}')

print('\nTodos os itens (1,2,3) foram processados e os arquivos salvos em images/results/.')
