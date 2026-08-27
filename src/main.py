"""TinyMe Test Application - FastAPI with PostgreSQL and Redis."""

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="TinyMe Test", version="1.0.0")


class HealthResponse(BaseModel):
    status: str
    version: str


@app.get("/health", response_model=HealthResponse)
async def health_check():
    return HealthResponse(status="healthy", version="1.0.0")


@app.get("/")
async def root():
    return {"message": "TinyMe DevOps Toolkit", "status": "running"}
