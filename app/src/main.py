from fastapi import FastAPI
from asyncio import sleep
from random import triangular


app = FastAPI()


@app.get("/")
async def read_root():
    # Create an expansive process to simulate load
    sleep_time = triangular(0.1, 2.0, 0.5)
    await sleep(sleep_time)  # Delay of 100ms to 2s, most likely around 500ms

    return {"message": "Hello, World!", "delay": sleep_time}
