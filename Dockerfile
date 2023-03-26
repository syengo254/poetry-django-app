FROM python:3.10.2

ENV PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry'

# install postgres client
RUN apt-get clean && apt-get -qq update \
    && apt-get install -qq lsb-release
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends apt-utils postgresql-client \
    && apt-get install -y --no-install-recommends gettext

WORKDIR /code

RUN pip install poetry
RUN poetry config virtualenvs.create false

COPY poetry.lock pyproject.toml /code/

RUN poetry install --no-root -n --no-ansi

COPY entrypoint.sh /code/entrypoint.sh
RUN chmod +x /code/entrypoint.sh
ENTRYPOINT [ "sh", "/code/entrypoint.sh" ]

COPY . /code
