FROM alpine:3.21

# Install Python, pip, and virtualenv
RUN apk add --no-cache python3 py3-pip py3-virtualenv build-base

# Copy source files
WORKDIR /usr/src/app
ADD . .

# Create and activate a virtual environment, then install requirements
RUN python3 -m venv /venv \
 && . /venv/bin/activate \
 && pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Entrypoint is main.py
CMD ["/venv/bin/python", "main"]