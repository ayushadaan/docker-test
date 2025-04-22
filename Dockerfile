FROM ubuntu:latest

#Set the working directory
WORKDIR /app

# copy the current directory contents into the container at /app
COPY requirements.txt /app/
COPY firstpy /app/firstpy

# install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y python3 python3-pip && pip install -r requirements.txt && cd /app/firstpy

# set environment variables
# ENV NAME World

#run the application
# CMD ["python3", "app.py"]

EXPOSE 8000

ENTRYPOINT [ "python3" ]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]