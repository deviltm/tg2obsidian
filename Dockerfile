FROM python:3.10-alpine

WORKDIR /code

COPY requirements.txt /code
RUN pip install -r requirements.txt

COPY . /code

CMD [ "python3", "./tg2obsidian_bot.py" ]
