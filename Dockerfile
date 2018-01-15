# This is the docker image available. I am using cpu version here. If needed there is gpu version available.
FROM bvlc/caffe:cpu

# Copy the file into docker
COPY requirements.txt requirements.txt

# Run the copied file
RUN pip install -r requirements.txt

# create a folder called model1 and copy all the files in the folder into that folder
RUN mkdir base

# Make model1 your work directory
WORKDIR /base

# Expose your port 8888
EXPOSE 8888

# Run the following command to give a token(password) to your jupyter notebook.
CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='demo'