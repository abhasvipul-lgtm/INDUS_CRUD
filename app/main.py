from fastapi import FastAPI
from .database import engine
from . import models
from .routes import records

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(records.router)

@app.get("/")
def home():
    return {"message": "CRUD API running"}