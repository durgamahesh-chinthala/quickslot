# Quickslot Server

Spring Boot server for Quickslot. Connects to MySQL and exposes endpoints under `/api`.

Run with Docker Compose:

```bash
docker compose up --build
```
Example curl commands:

- List venues
```
curl http://localhost:8080/api/venues
```

- List slots for venue 1 (today):
```
curl "http://localhost:8080/api/venues/1/slots?date=$(date +%F)"
```

- Book a slot (header or body `userId` accepted):
```
curl -X POST http://localhost:8080/api/bookings -H "Content-Type: application/json" -d '{"slotId":1, "userId":"user-1"}'
```

- Get user bookings:
```
curl http://localhost:8080/api/bookings/user/user-1
```

- Cancel booking (slotId):
```
curl -X DELETE http://localhost:8080/api/bookings/1 -H "X-User-Id: user-1"
```
