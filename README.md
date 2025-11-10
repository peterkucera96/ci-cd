# CI/CD + Docker + Kubernetes Demo

## Lokálne
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r app/requirements.txt
pytest
python app/app.py
# http://localhost:8080

