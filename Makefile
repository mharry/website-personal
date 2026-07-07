.DEFAULT_GOAL := help

.PHONY: help install dev build preview deploy publish clean

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*##"}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	npm install

dev: ## Start local dev server with hot reload
	npm run dev

build: ## Build static site to dist/
	npm run build

preview: build ## Build then serve locally for final review
	npm run preview

deploy: ## Show steps to commit and push changes to the dev branch
	@echo ""
	@echo "  To deploy to dev:"
	@echo "    git add -A"
	@echo "    git commit -m \"<your message>\""
	@echo "    git push origin dev"
	@echo ""

publish: ## Show steps to merge dev into main and trigger Cloudflare Pages deployment
	@echo ""
	@echo "  To publish to production:"
	@echo "    git checkout main"
	@echo "    git merge dev"
	@echo "    git push origin main"
	@echo "    git checkout dev"
	@echo ""

clean: ## Remove dist/ and node_modules/
	rm -rf dist node_modules
