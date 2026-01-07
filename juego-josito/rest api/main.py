from fastapi import FastAPI
from pydantic import BaseModel

# La variable se llama 'app', por eso el comando usa 'main:app'
app = FastAPI()

class GameData(BaseModel):
    apples: int
    bananas: int

@app.post("/puntuacion")
async def guardar_puntuacion(data: GameData):
    print(f"¡Datos recibidos desde Godot! Manzanas: {data.apples}, Bananas: {data.bananas}")
    return {"status": "recibido"}