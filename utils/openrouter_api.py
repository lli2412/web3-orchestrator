import requests

class OpenRouterAPI:
    def __init__(self, api_key):
        self.base_url = "https://api.openrouter.com"
        self.api_key = api_key

    def call_model(self, model_id, prompt, **kwargs):
        url = f"{self.base_url}/models/{{model_id}}/call"
        headers = {
            "Authorization": f"Bearer {{self.api_key}}",
            "Content-Type": "application/json"
        }

        data = {
            "prompt": prompt,
            **kwargs
        }

        response = requests.post(url, json=data, headers=headers)
        response.raise_for_status()
        return response.json()

    def estimate_cost(self, model_id, prompt_length):
        cost_per_token = 0.01  # Example cost per token
        estimated_cost = cost_per_token * prompt_length
        return estimated_cost
