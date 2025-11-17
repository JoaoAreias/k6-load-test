FROM python:3.12-slim

ENV PORT=5000

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir uv
RUN uv sync --no-group dev --no-cache --active

ENV PATH="/app/.venv/bin:$PATH"

CMD ["fastapi",  "run", "src/main.py"]
