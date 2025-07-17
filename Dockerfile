FROM python:3.9-slim-bullseye
WORKDIR /app
COPY python_project/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY python_project/app.py /app/app.py
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=app.py
ENV PYTHONDONTWRITEBACK=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV SECRET_KEY="your-secret-key"
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]