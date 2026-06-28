
from jose import jwt

SECRET_KEY="secret"

def create_token(data):
    return jwt.encode(data,SECRET_KEY,algorithm="HS256")
