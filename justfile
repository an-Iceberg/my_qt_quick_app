run:
  python main.py

activate-venv:
  source venv/bin/activate.fish

pip-freeze:
  pip freeze | cut -d"=" -f1 > requirements.txt
