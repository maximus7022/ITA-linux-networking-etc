FROM alpine:3.5

# specifying working directory
WORKDIR /usr/src/app/

# copying project files to container
COPY . /usr/src/app/

# installing python, pip and requirements
RUN apk add --update py2-pip && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /usr/src/app/requirements.txt

# run the application
CMD ["python", "/usr/src/app/app.py"]