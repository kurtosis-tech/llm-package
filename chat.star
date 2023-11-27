CHATBOT_UI_IMAGE = "ghcr.io/mckaywrigley/chatbot-ui:main"
DUMMY_OPEN_AI_KEY = "sk-XXXXXXXXXXXXXXXXXXXX"


def start_chat(plan, local_ai_url):
    plan.add_service(
        name="chat",
        config=ServiceConfig(
            image=CHATBOT_UI_IMAGE,
            env_vars={
                "OPENAI_API_KEY": DUMMY_OPEN_AI_KEY,
                "OPENAI_API_HOST": local_ai_url,
            },
            ports={"http": PortSpec(number=3000, transport_protocol="TCP")},
        ),
    )
