from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import Optional

from ..database import get_db
from .. import models, schemas
from ..auth import verify_api_key

router = APIRouter()

# CREATE
@router.post("/records", response_model=schemas.RecordResponse, dependencies=[Depends(verify_api_key)])
def create_record(record: schemas.RecordCreate, db: Session = Depends(get_db)):
    db_record = models.Record(**record.dict())
    db.add(db_record)
    db.commit()
    db.refresh(db_record)

    return db_record

# GET all
@router.get("/records", response_model=list[schemas.RecordResponse], dependencies=[Depends(verify_api_key)])
def get_records(status: Optional[str] = None, category: Optional[str] = None, db: Session = Depends(get_db)):
    query = db.query(models.Record)
    if status:
        query = query.filter(models.Record.status == status)
    if category:
        query = query.filter(models.Record.category == category)
    return query.all()

# UPDATE
@router.put("/records/{record_id}", response_model=schemas.RecordResponse, dependencies=[Depends(verify_api_key)])
def update_record(record_id: int, updated_record: schemas.RecordUpdate, db: Session = Depends(get_db)):
    record = db.query(models.Record).filter(models.Record.id == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
    update_data = updated_record.dict(exclude_unset=True)
    for key, value in update_data.items():
        setattr(record, key, value)
    db.commit()
    db.refresh(record)
    return record

# DELETE
@router.delete("/records/{record_id}", dependencies=[Depends(verify_api_key)])
def delete_record(record_id: int, db: Session = Depends(get_db)):
    record = db.query(models.Record).filter(models.Record.id == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
    db.delete(record)
    db.commit()
    return {"message": "Record deleted successfully"}