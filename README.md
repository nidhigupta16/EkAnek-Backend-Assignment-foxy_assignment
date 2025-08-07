# README

Complete simplified backend in Rails

JWT-based signup & login
 
File upload with Active Storage

APIs with curl examples

curl -X POST http://localhost:3000/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"user@gmail.com","password":"secret123"}'

curl -X POST http://localhost:3000/login \
  -H "Content-Type: application/json" \
  -d '{"email":"user@gmail.com","password":"secret123"}'

curl -X POST http://localhost:3000/file_uploads \
  -H "Authorization:  YOUR_TOKEN" \
  -F "title=Bank Docs" \
  -F "description=Confidential info" \
  -F "is_public=true" \
  -F "file=@/path/to/file.pdf"

curl -X DELETE http://localhost:3000/file_uploads/1 \
  -H "Authorization:  YOUR_TOKEN"

curl http://localhost:3000/public/abc123
