FROM node:21-alpine3.19

WORKDIR /usr/src/app

COPY package*.json ./
COPY package-lock.json ./

RUN npm install


COPY . .


# this will not work because database wil not be set up for the moment 
# we want to do the migration
# Environment variable not found: DATABASE_URL. So, comment both lines
#RUN npx prisma migrate dev

#useful command generate if the DB already exists
RUN npx prisma generate

EXPOSE 3004