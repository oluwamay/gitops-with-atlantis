---
# Local Setup for ATLANTIS
---
## *Setup Instructions*
### Make local-setup.sh executable
```bash
chmod +x ./local-setup.sh
```

Copy randomly generated secret from the execution output to github and `atlantis.var`

### Run ngrok
```bash
./ngrok http 4141
```
### Atlantis var
```text
SECRET=<random-string>
TOKEN=<GIT_TOKEN>
URL=<ngrok_url>
USERNAME=<github_username>
REPO_ALLOWLIST=<all_github repo link that will use atlantis>
REPO_CONFIG="./repos.yaml"
```
### Atlantis yaml config
```yaml
version: 3
projects:
	- name: poc
	dir: .
	workspace: poc
	workflow: poc
	autoplan:
		enabled: true
```

### Run atlantis
```bash
./start-atlantis.sh
```

## Set up your webhook on github using ngrok's url

