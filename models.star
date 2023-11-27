models = {
    "mistral": "github:go-skynet/model-gallery/mistral.yaml",
    "llama2": "github:go-skynet/model-gallery/openllama_3b.yaml",
    "llama2:7b": "github:go-skynet/model-gallery/openllama_7b.yaml",
    "codellama": "github:go-skynet/model-gallery/codellama-7b-instruct.yaml",
    "codellama:7b": "github:go-skynet/model-gallery/codellama-7b-instruct.yaml",
    "stablediffusion": "github:go-skynet/model-gallery/stablediffusion.yaml",
    "gpt-3.5-turbo": "github:go-skynet/model-gallery/gpt4all-j.yaml",
}


def supported_models():
    return ", ".join(models.keys())
