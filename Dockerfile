# Use NodeJS base image
FROM node:12.13.1

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g @ionic/cli



# Copy app source
COPY . .
RUN ionic build

# Bind the port that the image will run on
EXPOSE 8100

# Define the Docker image's behavior at runtime
CMD ["ionic", "serve", "--external", "--host=acf814c7d4dd04eb89d61f5146033503-538083464.eu-central-1.elb.amazonaws.com"]