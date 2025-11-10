# 1) Build/runtime base
FROM python:3.12-slim

# 2) System deps
RUN pip install --no-cache-dir --upgrade pip

# 3) App code
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ .

# 4) Run as non-root
RUN useradd -m appuser
USER appuser

# 5) Expose & start
EXPOSE 8080
CMD ["python", "app.py"]

