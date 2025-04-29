# Mapping Consumption Values and Sustainable Practices in Qatar

This project explores the latent dimensions of consumption values — Materialism, Luxury Orientation, Environmental Consciousness, and Frugality — in Qatar using Exploratory Factor Analysis (EFA) and Confirmatory Factor Analysis (CFA).

## Heatmap
![Heatmap](https://github.com/Haalibrahim/consumption-sustainability-efa-cfa/raw/main/figures/Figure2.png) 

## 📈 Scree Plot
![Scree Plot](https://github.com/Haalibrahim/consumption-sustainability-efa-cfa/raw/main/figures/Figure1.png)

## 🧩 CFA Path Diagram
![CFA Path Diagram](https://github.com/Haalibrahim/consumption-sustainability-efa-cfa/raw/main/figures/Figure3.png)

## 📚 Project Structure

- `/code/` — Python and R scripts for data analysis
- `/figures/` — Visualizations (Scree plot, heatmap, CFA diagrams, latent mean plots)
- `/results/` — Appendix tables and outputs

## 🔍 Methodology

- **Exploratory Factor Analysis (EFA)** with Varimax rotation
- **Confirmatory Factor Analysis (CFA)** using `lavaan` in R
- **Measurement Invariance Testing** (multi-group CFA)
- **Latent Mean Comparisons** by gender and nationality

## 📊 Results Summary

- 4 stable factors identified
- Strong model fit (CFI = 0.957, TLI = 0.942, RMSEA = 0.042)
- Measurement invariance supported
- Latent mean differences significant across demographics

## 🚀 How to Run

1. Clone the repository
2. Run `code/efa_analysis.py` for EFA and visualizations
3. Run `code/cfa_analysis.R` for CFA model and group comparisons

## 🏢 Authors

- **Hamad Al Ibrahim, MD, PhD**
- **Arokiasamy Perianayagam, PhD**
- **Noor Althani**

Affiliation: Social and Economic Survey Research Institute, Qatar University

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
