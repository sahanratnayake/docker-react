# First image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2nd image
FROM nginx
# Use 1st phase contruction
COPY --from=builder /app/build /usr/share/nginx/html


