from fastapi import Security, HTTPException, status
from fastapi.security.api_key import APIKeyHeader
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()

# Get API key from .env
API_KEY = os.getenv("API_KEY")

# Header name
API_KEY_NAME = "x-api-key"

# API key header
api_key_header = APIKeyHeader(name=API_KEY_NAME, auto_error=False)

# Verify API key
def verify_api_key(api_key: str = Security(api_key_header)):
    if api_key == API_KEY:
        return api_key
    raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid or missing API Key")