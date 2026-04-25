#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$PROJECT_DIR/.venv"
KERNEL_NAME="zum-text-clustering"
KERNEL_DISPLAY_NAME="Python (.venv) ZUM"

if [[ -n "${PYTHON_BIN:-}" ]]; then
  PYTHON_CMD="$PYTHON_BIN"
elif command -v python3.13 >/dev/null 2>&1; then
  PYTHON_CMD="python3.13"
elif command -v python3 >/dev/null 2>&1; then
  PYTHON_CMD="python3"
else
  echo "No suitable Python interpreter found."
  exit 1
fi

PYTHON_VERSION="$("$PYTHON_CMD" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
if [[ "$PYTHON_VERSION" == "3.14" ]]; then
  echo "Python 3.14 detected in: $PYTHON_CMD"
  echo "This project depends on gensim, which currently fails to build on Python 3.14."
  echo "Install Python 3.13 and rerun, or set PYTHON_BIN explicitly."
  exit 1
fi

echo "Creating virtual environment in: $VENV_DIR"
"$PYTHON_CMD" -m venv "$VENV_DIR"

echo "Activating virtual environment"
source "$VENV_DIR/bin/activate"

echo "Upgrading pip tooling"
python -m pip install --upgrade pip setuptools wheel

echo "Installing project dependencies"
python -m pip install -r "$PROJECT_DIR/requirements-local.txt"

echo "Registering Jupyter kernel: $KERNEL_DISPLAY_NAME"
python -m ipykernel install --user --name "$KERNEL_NAME" --display-name "$KERNEL_DISPLAY_NAME"

echo
echo "Setup complete."
echo "Python used: $PYTHON_CMD ($PYTHON_VERSION)"
echo "Next steps:"
echo "  1. source .venv/bin/activate"
echo "  2. Open the notebook in VS Code"
echo "  3. Select kernel: $KERNEL_DISPLAY_NAME"
