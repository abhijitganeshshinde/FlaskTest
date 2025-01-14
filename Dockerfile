# Stage 1: Build Stage
FROM python:3.9-slim-buster 

# Stage 3: Dependency Stage
WORKDIR /app
COPY ./requirements.txt /app
RUN pip install -r requirements.txt
COPY . .

# Stage 3: Test Stage
COPY ./test_app.py /app
RUN python3 -m unittest test_app.py

EXPOSE 5000
ENV FLASK_APP=app.py

# Run Flask application
CMD ["flask", "run", "--host", "0.0.0.0"]