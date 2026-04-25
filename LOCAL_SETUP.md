# Local Setup

Ten projekt najlepiej uruchamiać lokalnie w osobnym `.venv`, zamiast instalować pakiety do interpretera Homebrew `Python 3.14`.

## Rekomendowana wersja Pythona

Użyj `Python 3.13`, nie `3.14`.

Powód:
- projekt używa `gensim`,
- `gensim` obecnie nie buduje się poprawnie na `Python 3.14`,
- na Twoim komputerze jest już dostępny interpreter `/opt/homebrew/bin/python3.13`.

## Szybki start

W katalogu projektu uruchom:

```bash
chmod +x setup_local_env.sh
./setup_local_env.sh
```

To zrobi trzy rzeczy:
- utworzy lokalne środowisko `.venv`,
- zainstaluje zależności z `requirements-local.txt`,
- doda kernel Jupyter `Python (.venv) ZUM`.

Skrypt automatycznie wybiera `python3.13`, jeśli jest dostępny.

## Ręcznie

Jeśli wolisz wykonać to krok po kroku:

```bash
python3.13 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements-local.txt
python -m ipykernel install --user --name zum-text-clustering --display-name "Python (.venv) ZUM"
```

## VS Code

Po utworzeniu środowiska:
- otwórz `zum_project_quick.ipynb` albo `zum_project_full.ipynb`,
- wybierz `Notebook: Select Notebook Kernel`,
- wskaż `Python (.venv) ZUM`.

Jeśli nowy kernel nie pojawi się od razu:
- zrestartuj okno VS Code,
- albo użyj `Developer: Reload Window`.

## Colab

Pliki notebooków nadal są zgodne z Colabem. Lokalny `.venv` służy tylko do wygodnego uruchamiania ich na Twoim Macu bez konfliktu z Homebrew.
