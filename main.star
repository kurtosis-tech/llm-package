models = import_module("./models.star")
chat = import_module("./chat.star")

LOCAL_AI_IMAGE = "quay.io/go-skynet/local-ai:latest"
LOCAL_AI_SERVICE = "local-ai"
DEFAULT_MODEL = "gpt-3.5-turbo"

HTTP_PORT_NUM = 8080


def run(plan, model=DEFAULT_MODEL, chat_enabled=True):
    """Runs a local llm with an OpenAI style API

    Args:
        model (string): The model to use; defaults to gpt-3.5-turbo
        chat_enabled (bool): An optional Chat application to use the model with; defaults to true
    """

    model_url = models.models[model]

    plan.print(
        "We will be downloading the images so the startup speed will depeend on your internet connection"
    )

    preloaded_models = [{"url": model_url, "name": model}]

    local_ai_service = plan.add_service(
        name=LOCAL_AI_SERVICE,
        config=ServiceConfig(
            image=LOCAL_AI_IMAGE,
            ports={
                "http": PortSpec(
                    number=HTTP_PORT_NUM, transport_protocol="TCP", wait=None
                )
            },
            env_vars={"PRELOAD_MODELS": str(preloaded_models)},
        ),
        ready_conditions=ReadyCondition(
            recipe=GetHttpRequestRecipe(
                port_id="http",
                endpoint="readyz",
            ),
            field="code",
            assertion="==",
            target_value=200,
            interval="1m",
            timeout="5m",
        ),
    )

    local_ai_uri = "http://{0}:{1}".format(LOCAL_AI_SERVICE, HTTP_PORT_NUM)

    if chat_enabled:
        chat.start_chat(plan, local_ai_uri, model)

    plan.print("Local AI is running with model")
