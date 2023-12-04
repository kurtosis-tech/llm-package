# llm-package

This package illustrates how simple it is to compose applications involving LLMs with Kurtosis

This allows you to spin up the following models using the `model` argument

- mistral
- llama2 (3b is the default)
- llama2:7b
- codellama (3b is the default)
- codellama:7b
- stablediffusion
- gpt-3.5-turbo (default; actually gpt4all-j)

This package also allows spins up a ChatBot UI by default; there is a limitation on the UI which requires the 
model to be named [after an OpenAI model](https://github.com/mudler/LocalAI/issues/165)

This hasn't been tested on all platforms yet but [I](https://github.com/h4ck3rk3y) have tested this on a remote Linux instance
and my M1 Mac; `mistral` and `gpt-3.5-turbo` work just fine.

`llama` has shown some issues running locally that is being investigated

:warning: The spinner in the ChatBot UI application might spin for a bit; we recommend writing your prompt and hitting generate anyway

## Quickstart

```bash
kurtosis run github.com/kurtosis-tech/llm-package
```

To run `mistral`

```bash
kurtosis run github.com/kurtosis-tech/llm-package '{"model": "mistral"}'
```

To disable chat

```bash
kurtosis run github.com/kurtosis-tech/llm-package '{"chat_enabled": false}'
```

## JSON-RPC

We use [`LocalAI`](https://github.com/mudler/LocalAI) underneath which gives you a JSON-RPC API endpoint which resembles the OpenAI platform. After you run the command; you should be able to see what local port `8080` of the `local-ai` service maps to.

This means that you can use `langchain`, `pdfGPT` or any other libraries and platforms that would use OpenAI models by using the `JSON-RPC` endpoint. Also, as its completely containerized - you can have multiple models running in parallel.

## Issues and Feature Requests

This project encourages heavily using the `issues` tab.

If you want any LocalI supported model to be supported it should just require
adding a new line to `models.star`!

## Built with

- [Kurtosis](https://github.com/kurtosis-tech/kurtosis)
- [LocalAI](https://github.com/mudler/LocalAI)
- [ChatBot UI](https://github.com/mckaywrigley/chatbot-ui)