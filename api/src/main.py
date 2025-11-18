from fastapi import FastAPI
from asyncio import sleep
from random import triangular
from prometheus_fastapi_instrumentator import Instrumentator


app = FastAPI()
Instrumentator().instrument(app).expose(app)


@app.get("/")
async def read_root():
    # Create an expansive process to simulate load
    sleep_time = triangular(0.1, 2.0, 0.5)
    await sleep(sleep_time)  # Delay of 100ms to 2s, most likely around 500ms

    return {"message": "Hello, World!", "version": "0.0.0-0", "delay": sleep_time}
