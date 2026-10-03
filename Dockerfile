# Stage 1: Build stage
FROM python:3.11-slim AS builder
WORKDIR /app
run pip install --no-cache-dir uv
copy pyproject.toml uvlock ./
RUN uv sync --frozen

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# TODO 1
# Container가 8000번 포트를 사용한다는 정보를 남기고,
# uvicorn으로 main.py의 app을 0.0.0.0:8000에서 실행하세요.