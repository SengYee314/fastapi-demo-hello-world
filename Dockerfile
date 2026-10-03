FROM python:3.12-slim as builder

WORKDIR /app

RUN pip install --no-cache-dir uv

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen

COPY --from=builder /app /app
COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

# TODO 1
# Container가 8000번 포트를 사용한다는 정보를 남기고,
# uvicorn으로 main.py의 app을 0.0.0.0:8000에서 실행하세요.