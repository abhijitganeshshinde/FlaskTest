FROM python:3.9-slim-buster

WORKDIR /app
COPY ./requirements.txt /app
RUN pip install -r requirements.txt
COPY . .

COPY ./test_app.py /app
RUN python3 -m unittest test_app.py

EXPOSE 5000
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host", "0.0.0.0"]