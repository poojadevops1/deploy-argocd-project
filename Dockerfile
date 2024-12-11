# Use the official Nginx image as the base image
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Remove the default Nginx HTML files
RUN rm -rf ./*

# Copy your static website files to the container
COPY src/ .

# Expose the default Nginx port
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]

