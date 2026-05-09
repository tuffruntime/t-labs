# --- Colors declarations ---
BLUE         := \033[36m
GREEN        := \033[32m
YELLOW       := \033[33m
RED          := \033[31m
BOLD         := \033[1m
RESET        := \033[0m

# --- Variables ---
VENV         := .venv
PYTHON       := $(VENV)/bin/python3.14
PIP          := $(VENV)/bin/pip
PYTEST 	 	 := $(VENV)/bin/pytest

.PHONY: help setup-py create-py run-py clean-py test-py

# --- Help command ---
help:
	@echo "$(BOLD)$(GREEN)"
	@echo "  _______     _        _     ____  "
	@echo " |__   __|   | |      / \   | __ ) "
	@echo "    | |______| |     / _ \  |  _ \ "
	@echo "    | |______| |___ / ___ \ | |_) |"
	@echo "    |_|      |_____/_/   \_\|____/ $(RESET)"
	@echo ""
	@echo "$(BOLD)Available commands:$(RESET)"
	@echo "  $(YELLOW)make setup-py$(RESET)              - Create virtual environment (venv)"
	@echo "  $(YELLOW)make create-py NAME=...$(RESET)    - Create new Python lab"
	@echo "  $(YELLOW)make run-py FILE=...$(RESET)       - Run a specific Python file"
	@echo "  $(YELLOW)make clean-py$(RESET)              - Clean up cache and venv"
	@echo "  $(YELLOW)make test-py$(RESET)              - Run tests"
# Initialize virtual environment
setup-py:
	@test -d $(VENV) || python3.14 -m venv $(VENV)
	@$(PIP) install --upgrade pip
	@$(PIP) install pytest
	@echo "$(GREEN)✔ Virtual environment is ready at $(VENV)$(RESET)"

# Create new lab exercise
create-py:
	@$(MAKE) _create_file L=python N=$(NAME)
	@echo "def main():\n    print('Hello from T-Labs: $(NAME)')\n\nif __name__ == '__main__':\n    main()" > python/$(NAME).py
	@echo "$(GREEN)✔ Python lab ready: python/$(NAME)$(RESET)"

_create_file:
	@if [ -z "$(N)" ]; then echo "$(RED)Error: NAME is required$(RESET)"; exit 1; fi

# Run code using venv
run-py:
	@$(MAKE) _run L=python F=$(FILE)

_run:
	@if [ -z "$(F)" ]; then echo "$(RED)Error: FILE is required$(RESET)"; exit 1; fi
	@$(PYTHON) $(L)/$(F)

# Run tests (placeholder)
test-py:
	@if [ -f ./python/tests/main.py ]; then echo "$(GREEN)Tests found. Running...$(RESET)"; else echo "$(YELLOW)No tests found. Skipping...$(RESET)"; fi
	@$(PYTEST) -v --force-short-summary ./python/tests/main.py || echo "$(RED)Tests failed or not found. Please implement tests in ./python/tests/main.py$(RESET)"

# Clean up virtual environment and cache
clean-py:
	@if [ -d $(VENV) ]; then echo "$(YELLOW)Removing virtual environment...$(RESET)"; else echo "$(YELLOW)No virtual environment found. Skipping...$(RESET)"; fi
	@rm -rf $(VENV)
	@if [ -d __pycache__ ]; then echo "$(YELLOW)Removing __pycache__ directories...$(RESET)"; else echo "$(YELLOW)No __pycache__ directories found. Skipping...$(RESET)"; fi
	@find ./ -type d -name "__pycache__" -exec rm -rf {} +
	@echo "$(YELLOW)Clean up complete!$(RESET)"
	@if [ -d .pytest_cache ]; then echo "$(YELLOW)Removing pytest cache directories...$(RESET)"; else echo "$(YELLOW)No pytest cache directories found. Skipping...$(RESET)"; fi
	@find ./ -type d -name ".pytest_cache" -exec rm -rf {} +
	@echo "$(YELLOW)Clean up complete!$(RESET)"