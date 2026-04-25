# Local Setup

Ten projekt najlepiej uruchamiać lokalnie w osobnym `.venv`, zamiast instalować pakiety do interpretera.

## Aktualny status repo

Stan na teraz:
- główny notebook projektu: `zum_pipeline_report.ipynb`,
- lokalne środowisko `.venv` i skrypt `setup_local_env.sh` są gotowe do użycia,
- artefakty wyników zapisują się do:
  - `artifacts_quick/`,
  - `artifacts_full/`,
- sekcja 10 w notebooku zawiera tabele i wykresy przekrojowe (silhouette, ARI, Davies-Bouldin, Dunn, `quality_score`, runtime),
- pipeline dla `kmeans` i `hierarchical` działa end-to-end,
- `dbscan` i `spectral` są przygotowane jako szkielety (TODO) i domyślnie nie są aktywne w standardowym przebiegu.

## Rekomendowana wersja Pythona

Użyj `Python 3.13`, nie `3.14`.

Powód:
- projekt używa `gensim`,
- `gensim` obecnie nie buduje się poprawnie na `Python 3.14`,

## Szybki start

W katalogu projektu uruchom:

```bash
chmod +x setup_local_env.sh
./setup_local_env.sh
```

To zrobi trzy rzeczy:
- utworzy lokalne środowisko `.venv`,
- zainstaluje zależności z `requirements-local.txt`,
- doda kernel Jupyter `Python (.venv)`.

Skrypt automatycznie wybiera `python3.13`, jeśli jest dostępny.

## Ręcznie

Jeśli wolisz wykonać to krok po kroku:

```bash
python3.13 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements-local.txt
python -m ipykernel install --user --name zum-text-clustering --display-name "Python (.venv)"
```

## VS Code

Po utworzeniu środowiska:
- otwórz `zum_pipeline_report.ipynb`,
- wybierz `Notebook: Select Notebook Kernel`,
- wskaż `Python (.venv)`.

Jeśli nowy kernel nie pojawi się od razu:
- zrestartuj okno VS Code,
- albo użyj `Developer: Reload Window`.

