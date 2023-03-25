FROM python:3.10.2

ENV PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry'

WORKDIR /code

COPY poetry.lock pyproject.toml /code/

RUN pip3 install poetry

RUN poetry install -n --no-ansi

COPY . .
