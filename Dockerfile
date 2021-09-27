# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY sample-angular1 /usr/local/app/

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/firstApp /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# Expose port 80
EXPOSE 80
