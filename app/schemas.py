from pydantic import BaseModel
from typing import Optional

# Request schema for creating records
class RecordCreate(BaseModel):
    title: str
    description: Optional[str] = None
    status: Optional[str] = "active"
    category: Optional[str] = None

# Request schema for updating records
class RecordUpdate(BaseModel):
    title: Optional[str] = None
    description: Optional[str] = None
    status: Optional[str] = None
    category: Optional[str] = None

# Response schema
class RecordResponse(BaseModel):
    id: int
    title: str
    description: Optional[str]
    status: Optional[str]
    category: Optional[str]

    class Config:
        from_attributes = True