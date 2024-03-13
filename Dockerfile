FROM python:3.10-slim-buster
WORKDIR /app

# Copy only the requirements.txt file, to cache the installed Python packages
COPY requirements.txt /app/

RUN apt update && \
    apt -y upgrade && \
    apt install -y ffmpeg libffi-dev && \  # Added libffi-dev if needed by any of the dependencies
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt  # Use pip to install dependencies from requirements.txt

EXPOSE 8501

# Copy the rest of your application code
COPY . /app

ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
