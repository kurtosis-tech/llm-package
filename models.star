models = {
    "mistral": "https://github.com/go-skynet/model-gallery/blob/main/mistral.yaml",
    "llama2": "https://github.com/go-skynet/model-gallery/blob/main/openllama_3b.yaml",
    "llama2:7b": "https://github.com/go-skynet/model-gallery/blob/main/openllama_7b.yaml",
    "codellama": "https://github.com/go-skynet/model-gallery/blob/main/codellama-7b-instruct.yaml",
    "codellama:7b": "https://github.com/go-skynet/model-gallery/blob/main/codellama-7b-instruct.yaml",
    "stablediffusion": "https://github.com/go-skynet/model-gallery/blob/main/stablediffusion.yaml",
}

def supported_models():
    return ", ".join(models.keys())