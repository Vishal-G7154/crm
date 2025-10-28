# API Documentation

## Endpoints

### Health Check
- **GET** `/api/health`
- Returns: `{"status": "ok", "service": "CRM API"}`

### Authentication
- **GET** `/auth/login` - Login page
- **POST** `/auth/login` - Login endpoint
- **GET** `/auth/logout` - Logout

### Users
- **GET** `/api/users` - Get users (requires auth)
- **POST** `/api/users` - Create user (requires auth)
