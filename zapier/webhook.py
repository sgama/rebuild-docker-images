# Microbadger Payload
# {"text": "Hi, it's MicroBadger, sending you a test notification for linuxserver/radarr https://microbadger.com/images/linuxserver/radarr", "new_tags": [], "image_name": "linuxserver/radarr", "changed_tags": [], "deleted_tags": []}

slack_webhook_url = "https://hooks.slack.com/services/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"
payload={"text": input_data["raw_body"]}
response = requests.post(slack_webhook_url, json=payload)
response.raise_for_status()
body={"request": {"branch":"master"}}
headers = {
    "Travis-API-Version": "3",
    "User-Agent": "API Explorer",
    'Authorization': 'token qQ7YGKWelTcEJTPYxS5dbg'
}
travis_url="https://api.travis-ci.com/repo/sgama%2Fprometheus-postgresql-adapter/requests"
response2 = requests.post(travis_url, json=body, headers=headers)
response2.raise_for_status()
return {"data0": response.text, "data1": response2.text}